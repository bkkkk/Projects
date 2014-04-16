class Account
  attr_reader :name, :initial 

  def initialize(name, initial)
    @name     = name
    @balance  = initial
  end

  def widthraw(amount)
    @balance -= amount
    return @balance
  end 

  def deposit(amount)
    @balance += amount
    return @balance
  end

  def to_s
    "Name: #{@name}, Current Balance: #{@balance}"
  end
end

class CheckingAccount < Account
  def initialize(name, initial)
    super(name, initial)
  end
end

class SavingsAccount < Account
  def initialize(name, initial, interest)
    super(name, initial)
    
    if interest > 1
      @interest = interest / 100.0
    else
      @interest = interest
    end

  end

  def interestInPercentage
    @interest * 100
  end

  def interestInPercentage=(value)
    @interest = value / 100
  end

  def interest=(value)
    if value < 0
      puts "Negative interest rate is not valid"
      return
    end

    if value > 1
      interestInPercentage = value
    else
      @interest = value
    end
  end

  def to_s
    super + ", Interest #{interestInPercentage}%"
  end
end

if __FILE__ == $0
  savings = SavingsAccount.new("Jacobo Blanco", 1000, 5)
  savings.deposit(100)
  puts savings
  savings.interest = 10
  savings.interest = -10
end
