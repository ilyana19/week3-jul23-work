class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(spd, str)
    if spd > @@max_speed
      @spd = @@default_speed
    else
      @spd = spd
    end

    if str > @@max_strength
      @str = @@default_strength
    else
      @str = spd
    end
  end

  def encounter
    if outrun_zombie?
      return "You outran the zombie"
    elsif !outrun_zombie? && survive_attack?
      turned_zombie = Zombie.new(Random.rand(@@max_speed), Random.rand(@@max_strength))
      @@horde << turned_zombie
      return "You turned into a zombie"
    elsif !outrun_zombie? && !survive_attack?
      return "You died"
    end
  end

  def outrun_zombie?
    player_spd = Random.rand(@@max_speed)
    if player_spd > @spd
      return true
    else
      return false
    end
  end

  def survive_attack?
    player_str = Random.rand(@@max_strength)
    if player_str > @str
      return true
    else
      return false
    end
  end

  def self.all
    return @@horde
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end

  def self.some_die_off
    Random.rand(1..10).times do
      @@horde.pop
    end
  end

  def self.spawn
    Random.rand(@@plague_level).times do
      @@horde << self.new(Random.rand(@@max_speed), Random.rand(@@max_strength))
    end
  end

  def self.increase_plague_level
    @@plague_level += Random.rand(0..2)
  end
end

puts Zombie.all.inspect # => []
Zombie.new_day
puts Zombie.all.inspect

zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]

puts zombie1.encounter if Zombie.all[0]
puts zombie2.encounter if Zombie.all[1]
puts zombie3.encounter if Zombie.all[2]

puts Zombie.all.inspect