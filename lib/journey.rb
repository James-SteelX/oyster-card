class Journey

  attr_accessor :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end
end
