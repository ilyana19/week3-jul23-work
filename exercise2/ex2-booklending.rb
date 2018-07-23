class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def due_date
    return @due_date
  end

  def due_date=(date)
    return @due_date = date
  end

  def borrow
    if self.lent_out? # "self" functions like how "this" does in other langauges
      puts "Book is not available"
      return false
    else
      self.due_date = Book.current_due_date # call the Book class current_due_date
      @@on_shelf.delete(self)
      @@on_loan << self
      puts "Book is available"
      return true
    end
  end

  def return_to_library
    if self.lent_out?
      self.due_date = nil
      @@on_loan.delete(self)
      @@on_shelf << self
      return true
    else
      return false
    end
  end

  def lent_out?
    return @@on_loan.include?(self)
  end

  def self.create(title, author, isbn)
    new_book = self.new(title, author, isbn)
    @@on_shelf.push(new_book)
    return new_book
  end

  def self.current_due_date
    # return Time.now + (60*60*24*14) # 14 days later from now
    return Time.now + (2) # 2 seconds after borrowed is called
  end

  def self.overdue_books
    overdue = []
    @@on_loan.each do |book|
      if Time.now > book.due_date
        overdue << book
      end
    end
    return overdue
  end

  def self.browse
    return @@on_shelf.sample
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end
end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")

# puts Book.browse.inspect
# puts Book.browse.inspect
# puts Book.browse.inspect

# puts Book.available.inspect

# puts Book.borrowed.inspect # []
# puts sister_outsider.lent_out? # false
puts sister_outsider.borrow # true
# puts sister_outsider.lent_out? # true
# puts sister_outsider.borrow # false
# puts sister_outsider.due_date

# puts Book.available.inspect
# puts Book.borrowed.inspect

sleep 4
puts aint_i.borrow
# puts aint_i.due_date
# puts sister_outsider.due_date
# puts Book.borrowed.inspect

# sleep 2
# puts sister_outsider.return_to_library # true
# puts sister_outsider.lent_out? # false
# puts sister_outsider.borrow # true

# puts Book.available.inspect
# puts Book.borrowed.inspect

sleep 4
puts "Overdue:"
puts "sister: #{sister_outsider.due_date}"
puts "aint i: #{aint_i.due_date}"

sleep 6
puts Book.overdue_books.inspect