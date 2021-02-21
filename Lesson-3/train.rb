class Train
  attr_reader :number, :type, :number_of_cars, :speed, :current_station, :route

  def initialize(number, type, number_of_cars, speed = 0) 
    @number = number
    @type = type
    @number_of_cars = number_of_cars
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

  def add_number_of_cars
    number_of_cars +=1 if speed == 0
  end

  def remove_number_of_cars
    number_of_cars -=1 if speed == 0 && number_of_cars > 0
  end

  def add_route(route)
    @route = route
    @current_station = route.first_station
  end

  def next_station
    @route.station_list[@current_station_index + 1]
  end

  def prev_station
    @route.station_list[@current_station_index - 1]
  end

  def current_station
    @route.station_list[@current_station_index]
  end

  def move_to_next
    if @current_station == @route.last_station
      puts "Вы находитесь на последней станции"
    else
      @current_station = route.station_list[@current_station_index += 1]
    end
  end

  def move_to_back
    if @current_station == @route.first_station
      puts "Вы на начальной станции"
    else
      @current_station = route.station_list[@current_station_index -= 1]
    end
  end
end
