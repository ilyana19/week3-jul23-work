class Item
  # @@tax = 0.13

  def initialize(name, price)
    @name = name
    @price = price
    @quantity = 1
  end

  #reader/setter shorthands
  attr_reader :name
  attr_accessor :price, :quantity

  def total_items
    @price *=  @quantity
  end
end

# test = Item.new("apple", 2)
# test.quantity = 2
# p test
# p test.total_items