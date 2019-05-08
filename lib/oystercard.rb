class Oystercard
  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station

  def initialize
    @entry_station = nil
    @balance = 0
  end

  def top_up(value)
    raise "Cannot go past #{LIMIT}" if value + balance > LIMIT
    @balance += value
  end

  def touch_in(station)
    raise "Insufficient funds" if MINIMUM_BALANCE > @balance
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

private
  def deduct(value)
    @balance -= value
  end
end
