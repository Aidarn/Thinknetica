class Train
  include Company
  include InstanceCounter
  attr_reader :number, :type, :number_of_cars, :speed, :current_station, :route, :wagons_list
  @@number = []
  NUMBER_FORMAT = /^\w{3}[-]?\w{2}$/

  private

  attr_writer :wagon_list, :current_station, :speed, :route

  public
  
  def self.find(num)
    number = @@number.find { |number| number == num }
    puts "#{number}"
  end

  def initialize(number, type) 
    @number = number
    @@number << self.number
    @type = type
    @wagons_list = []
    @speed = 0
    @current_station_index = 0
    validate!
    register_instance
  end

  def add_speed
    @speed += 10
  end

  def reduce_speed
    @speed -= 10 if speed > 0
  end

  def stop
    @speed = 0
  end

  def current_station
    @route.station_list[@current_station_index]
  end

  def add_wagon(wagon)
    wagons_list << wagon 
  end

  def remove_wagon(wagon)
    wagons_list.pop
  end

  def add_route(route)
    @route = route
    @current_station = 0
    current_station.add_train(self)
  end

  def move_to_next
    if @current_station == @route.last_station
      puts "Вы находитесь на последней станции"
    else
      current_station.delete_train(self)
      @current_station_index += 1
      current_station.add_train(self)
      puts "Поезд перенесен на следующую станцию"
    end
  end

  def move_to_back
    if @current_station == @route.first_station
      puts "Вы на начальной станции"
    else
      current_station.delete_train(self)
      @current_station_index -= 1
      current_station.add_train(self)
      puts "Поезд перенесен на предыдущую станцию"
    end
  end

  def iterate_through_wagons
    yield(wagons_list) if block_given?
  end

  private

  def validate!
    raise ArgumentError, "Номер должен быть строкой" if number.class != String
    raise ArgumentError, "Неправильный формат номера" if number !~ NUMBER_FORMAT
    raise StandardError, "Неправильный тип поезда" if (type != :cargo && type != :passenger)
  end
end