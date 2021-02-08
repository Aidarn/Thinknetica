class Train
  attr_reader :number, :type, :size, :speed, :current_station, :route

  def initialize(number, type, size, speed = 0) 
    @number = number
    @type = type
    @size = size
    @speed = speed
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

  def add_size
    size +=1 if speed == 0
  end

  def remove_size
    size -=1 if speed == 0 && size > 0
  end

  def add_route(route)
    @route = route
    @current_station = route.first_station
    route_index = 0
  end

  def move_to_next
    if @current_station == route.last_station
      puts "Вы находитесь на последней станции"
    else
      current_station.delet_train(self)
      @route_index += 1
      current_station.add_train(self)
    end
  end

  def move_to_back
    if @current_station == route.first_station
      puts "Вы на начальной станции"
    else
      current_station.delet_train(self)
      @route_index -=1
      current_station.add_train(self)
    end
  end

  def next_station
    @route.stations[@route_index + 1]
  end

  def prev_station
    @route.stations[@route_index - 1]
  end

  def current_station
    @route.stations[@route_index]
  end
end