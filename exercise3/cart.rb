require_relative 'item'

class Cart
  @@tax = 0.13

  def initialize
    @shopping_cart = []
  end

  def add(item)
    @shopping_cart << item
  end

  def remove(item)
    @shopping_cart.delete(item)
  end

  def total_before_tax
    @total = 0
    @shopping_cart.each do |item|
      @total += item.total_items
    end
    return @total
  end

  def total_after_tax
    grand_total = @total * (1 + @@tax)
    return grand_total.round(2)
  end
end

apples = Item.new("apple", 2.00)
oranges = Item.new("orange", 1.60)
grapes = Item.new("grapes", 2.50)

cart = Cart.new
cart.add(apples)
apples.quantity = 6

cart.add(oranges)
oranges.quantity = 8

cart.add(grapes)
grapes.quantity = 1

p cart

puts
puts "Total before tax: #{cart.total_before_tax}"
puts "Total after tax: #{cart.total_after_tax}"