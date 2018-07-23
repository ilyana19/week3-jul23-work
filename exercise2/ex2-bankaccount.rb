class BankAccount
  @@interest_rate = 0.01
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def balance=(n)
    @balance = n
  end

  def deposit(n)
    @balance += n
  end

  def withdrawl(n)
    @balance -= n
  end

  # class methods
  def self.create
    new_account = self.new
    @@accounts.push(new_account)
    return @@accounts.last
  end

  def self.total_funds
    total = 0

    @@accounts.each do |a|
      total += a.balance
    end

    return total
  end

  def self.interest_time
    @@accounts.each do |a|
      a.balance *= (1.00+@@interest_rate).round(2)
    end
  end
end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # => 0
puts BankAccount.total_funds # => 0

my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # => 200
puts your_account.balance # => 1000
puts BankAccount.total_funds # => 1200

BankAccount.interest_time
puts my_account.balance # => 202.0
puts your_account.balance # => 1010.0
puts BankAccount.total_funds # => 1212.0

my_account.withdrawl(50)
puts my_account.balance # => 152.0
puts BankAccount.total_funds # => 1162.0