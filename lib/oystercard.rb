class Oystercard
  LIMIT = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Cannot go past #{LIMIT}" if value + balance > LIMIT
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    raise "Insufficient funds" if MINIMUM_BALANCE > @balance 
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
