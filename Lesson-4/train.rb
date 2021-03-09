class Train
  attr_reader :number, :type, :number_of_cars, :speed, :current_station, :route, :wagons_list

  def initialize(number, type, speed = 0) 
    @number = number
    @type = type
    @wagons_list = []
    @speed = speed
    @current_station_index = 0
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

  def add_wagon(wagon)
    wagons_list << wagon if (speed == 0 ) && (wagon.type == type)
  end

  def remove_wagon
    wagons_list.pop if (speed == 0) && (wagon.type == type)
  end

  def add_route(route)
    @route = route
    @current_station = 0
    current_station.add_train(self)
  end

  def current_station
    @route.station_list[@current_station_index]
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
      @current_station = route.station_list[@current_station_index -= 1]
      puts "Поезд перенесен на предыдущую станцию"
    end
  end
end