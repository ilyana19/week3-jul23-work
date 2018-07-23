class Vampire
  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

  # attr_reader
  # attr_writer
  # attr_accessor (both read and write)

  def drank_blood_today
    return @drank_blood_today
  end

  def drank_blood_today=(boolean)
    return @drank_blood_today = boolean
  end

  def in_coffin
    return @in_coffin
  end

  def in_coffin=(boolean)
    return @in_coffin = boolean
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

  def self.create(name, age)
    new_vampire = self.new(name, age)
    @@coven.push(new_vampire)
    return new_vampire
  end

  def self.sunrise
    # delete if vampire one or the other state is false.
    @@coven.delete_if{|vampire| !vampire.drank_blood_today || !vampire.in_coffin}
    return @@coven
  end

  def self.sunset
    @@coven.each do |vampire|
        vampire.drank_blood_today = false
        vampire.in_coffin = false
     end
  end

  def self.all
    return @@coven
  end
end

zero = Vampire.create("Zero", 18)
akatsuki = Vampire.create("Akatsuki", 20)
yuuki = Vampire.create("Yuuki", 16)

p Vampire.all

sleep 2
zero.drink_blood
akatsuki.go_home
yuuki.drink_blood
yuuki.go_home
puts ""
p Vampire.all

sleep 2
Vampire.sunrise
puts ""
puts "It's day time now"
p Vampire.all # => Only Yuuki is left now because Zero only drank blood, didn't go home while Akatsuki went home without drinking blood

sleep 2
Vampire.sunset
puts ""
puts "It's sun set"
p Vampire.all # => resets state, Yuuki needs to go out and get food again