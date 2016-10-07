require_relative 'journey'

class JourneyLog

  def initialize(journey_class: Journey)
    #@journey_class = journey_class
    @journeys = []
  end

  def add(current)
    @journeys.push(current)
  end

  # def start(station)
  #   journey = @journey_class.new(entry_station: station, exit_station: nil)
  #   @journeys << journey
  # end
  # def finish(station)
  #   journey[exit_station: station]
  #   @journeys << journey
  # end
  def journeys
    @journeys.dup
  end
end
