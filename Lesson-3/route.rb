class Route

  attr_reader :first_station, :last_station, :intermediate_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    intermediate_station = []
  end

  def add(station)
    intermediate_station << station
  end

  def delet(station)
    intermediate_station.delet(station)
  end

  def station_list
    [first_station] + intermediate_station + [last_station]
  end
end