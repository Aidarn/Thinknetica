require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'wagon.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_wagon.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_wagon.rb'
require_relative 'interface.rb'

class Menu
  attr_accessor :trains, :routes, :stations, :stop

  def initialize
    @trains = []
    @routes = []
    @stations = []
    @stop = 1
  end
  
  def run
    loop do
      if @stop == 0
        puts "Программа завершена"
        break
      else
    puts MENU
    action = gets.chomp.to_i
    selected_action(action)
      end
    end
  end

  private
  
  def what_create(action)
    puts CREATE
    action = gets.chomp.to_i
    case action
    when 1
      create_train
    when 2
      create_route
    when 3
      create_station
    end
  end

  def trains_operation(action)
    if !trains.empty?
      puts CHOICE
      trains.each_with_index {|train, number| puts "Номер: #{number} Поезд: #{train.number} тип: #{train.type}"}
      train_number = gets.chomp.to_i
      puts TRAINS_MENU
     action = gets.chomp.to_i
      case action
      when 1
        assign_route(train_number)
      when 2
        add_wagon_to_train(train_number)
      when 3
        remove_wagon_to_train(train_number)
      when 4 
         move_train_to_next(train_number)
      when 5 
        move_train_to_back(train_number)
      end
    else
      puts NO_SUCH_OBJECTS
    end
  end 
  
  def route_operations
    puts CHOICE
    routes.each_with_index {|route, index| puts "Номер: #{index}, Маршрут: #{route.station_list.map{|station| station.name }}"}
    route_number = gets.chomp.to_i
    puts ROUTE_MENU
    action = gets.chomp.to_i
    case action
    when 1
    add_station_on_route(route_number)
    when 2
    delete_station_in_route(route_number)
    end
  end

  def selected_action(action)
    case action
    when 1
      what_create(action)
    when 2
      trains_operation(action)
    when 3 
      route_operations
    when 4 
      show_the_list_of_trains_at_the_station
    else 
      stop
    end
  end

 def create_train
    puts "Введите номер поезда"
    train_name = gets.chomp
    puts "Выберите тип поезда: 1-cargo, 2-passenger"
    train_type = gets.chomp.to_i
    trains.push CargoTrain.new(train_name) if train_type == 1
    trains.push PassengerTrain.new(train_name) if train_type == 2
  end

  def create_station
    puts "Введите название станции"
    station_name = gets.chomp
    stations << station = Station.new(station_name)
  end
  
  def create_route
    if !stations.empty?
      puts "Список станций:"
      stations.each_with_index {|station, index| puts "Номер: #{index}, Название: #{station.name}"} 
      puts "Введите номер начальной станции"
      first_station = gets.chomp.to_i
      puts "Введите номер последней станции"
      last_station = gets.chomp.to_i
      routes << Route.new(stations[first_station], stations[last_station])
      routes.each_with_index {|route, index| puts "#{route.station_list.map{ |station| station.name }}"}
    else
      puts NO_SUCH_OBJECTS
    end
  end

  def assign_route(train_number)
    if !routes.empty?
      puts "Список досупных маршрутов"
      routes.each_with_index {|route, index| puts "Номер: #{index}, Маршрут: #{route.station_list.map{|station| station.name }}"}
      puts CHOICE
      route_number = gets.chomp.to_i
      trains[train_number].add_route(routes[route_number])
      puts ADD
    else
      puts NO_SUCH_OBJECTS
    end
  end

  def add_wagon_to_train(train_number)
    wagon = CargoWagon.new(CargoWagon::TYPE) if trains[train_number].type == :cargo
    wagon = PassengerWagon.new(PassengerWagon::TYPE) if trains[train_number].type == :passenger
    trains[train_number].add_wagon(wagon)
    puts ADD
    trains.each_with_index {|train, number| p "Текущий список вагонов поезда: #{train.wagons_list}"}
  end

  def remove_wagon_to_train(train_number)
    wagon = CargoWagon.new(CargoWagon::TYPE) if trains[train_number].type == :cargo
    wagon = PassengerWagon.new(PassengerWagon::TYPE) if trains[train_number].type == :passenger
    trains[train_number].remove_wagon(wagon)
    puts DELETE
  end

  def move_train_to_next(train_number)
    trains[train_number].move_to_next
  end

  def move_train_to_back(train_number)
    trains[train_number].move_to_back
  end

  def add_station_on_route(route_number)
    puts "Список станций:"
    stations.each_with_index {|station, index| puts "Номер: #{index}, Название: #{station.name}"}
    puts "Введите номер промежуточной станции"
    station_number = gets.chomp.to_i
    routes[route_number].add_station(stations[station_number])
    puts ADD
  end

  def delete_station_in_route(route_number)
    puts "Список станций в маршруте:"
    routes[route_number].station_list.each_with_index {|route, number| puts "Номер: #{number}, Название #{route.name}"}
    puts "Выберите номер станции для удаления"
    station_number = gets.chomp.to_i
    station = routes[route_number].station_list[station_number]
    routes[route_number].delete_station(station)
    routes[route_number].station_list.each_with_index {|route, number| puts "Номер: #{number}, Название #{route.name}"}
    puts DELETE
  end
  
  def show_the_list_of_trains_at_the_station
    stations.each_with_index do |station, index|
      puts "Назвние станции: #{station.name}"
      puts "Список грузовых поездов на станции #{station.cargo_trains.map {|train| train.number}}" if !station.cargo_trains.empty?
      puts "Список пассажирских поездов на станции #{station.passenger_trains.map {|train| train.number}}" if !station.passenger_trains.empty?
    end
  end

  def stop
    @stop = 0
  end
end

menu = Menu.new
menu.run