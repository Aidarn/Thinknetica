class Route
  include InstanceCounter
  attr_accessor :first_station, :last_station, :intermediate_stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
    register_instance
  end

  def add_station(station)
    @intermediate_stations << station
  end

  def delete_station(station)
    @intermediate_stations.delete(station)
  end

  def station_list
    [@first_station] + @intermediate_stations + [@last_station]
  end
end