require_relative 'journey'
require_relative 'journey_log'


class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :current_journey


  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize(balance = 0)#, limit = self.class::DEFAULT_LIMIT)
    @balance = balance
    @log = JourneyLog.new
  #  @entry_station = nil
  #  @exit_station = nil
  #  @journeys = []
  #  @current_journey = Hash.new
  end

  def top_up(amount)
    fail "Card limit of £#{MAXIMUM_BALANCE} has been reached." if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if @balance < MINIMUM_BALANCE
    @current = Journey.new(entry_station)
    # fail "Already touched in!" if (in_journey? == true)
    #@entry_station = entry_station
  end

  def touch_out(exit_station)
    #@exit_station = exit_station
    deduct(MINIMUM_FARE)
    @current.exit_station = exit_station
    @log.add(@current)
    @current = nil 
    #add_journey
  end

  #def add_journey
  #  @current_journey = {entry_station: entry_station, exit_station: exit_station}
  #  @journeys << @current_journey
#  end

#  def in_journey?
#    !!entry_station
#  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

=begin
 only touch in/out
 top up
 balance
=end
