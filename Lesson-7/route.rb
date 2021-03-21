class Route
  include InstanceCounter
  include Validation
  attr_accessor :first_station, :last_station, :intermediate_stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
    validate!    
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

  private

  def validate!
    raise "Не верно указана первая станция" if first_station.class != Station
    raise "Не верно указана последняя станция" if last_station.class != Station
  end
end