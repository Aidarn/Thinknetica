require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'wagon.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_wagon.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_wagon.rb'

class Menu
  attr_accessor :trains, :routes, :stations

  def initialize
    @trains = []
    @routes = []
    @stations = []
  end

  MENU = <<~here

  Что вы хотите сделать?
  _________________________________
  1-Создать поезд, маршрут, станцию
  2-Произвести операции с поездами
  here

  CREATE = <<~here
  _________________
  1-Создать поезд
  2-Создать маршрут
  3-Создать Станцию
  here

  TRAINS_MENU = <<~here
  _____________________
  1-Назначить маршрут поезду
  2-Операции с вагонами
  3-Переместить поезд по маршруту
  here
  
  def run
    puts MENU
    action = gets.chomp.to_i
    selected_action(action)
  end
  
  def selected_action(action)
    case action
    when 1
      what_create(action)
    when 2
      trains_operation(action)
    end
  end

  def what_create(action)
    puts CREATE
    action = gets.chomp.to_i
    case action
    when 1
      create_train
    when 2
      create_route
    else 3
      create_station
    end
  end

  def trains_operation(action)
    case action
    when 1
      assign_route
    when 2
      wagons_operations
    when 3
      trains_move
    end
  end 

  def create_train
    puts "Введите номер поезда"
    train_name = gets.chomp.to_i
    puts "Выберите тип поезда: 1-cargo, 2-passenger"
    train_type = gets.chomp.to_i
    trains << CargoTrain.new(train_name) if train_type == 1
    trains << PassengerTrain.new(train_name) if train_name == 2
    run
  end

  def create_station
    puts "Введите название станции"
    station_name = gets.chomp
    stations << station = Station.new(station_name)
    run    
  end
  
  def create_route
    puts "Список станций:"
    stations.each_with_index {|station, index| puts "Номер: #{index}, Название: #{station.name}"}
    puts "Введите номер начальной станции"
    first_station = gets.chomp.to_i
    puts "Введите номер последней станции"
    last_station = gets.chomp.to_i
    routes << Route.new(stations[first_station], stations[last_station])
    routes.each_with_index {|route, index| puts "#{route.station_list.map{ |station| station.name }}"}
    run
  end
  #- Назначать маршрут поезду
  #- Добавлять вагоны к поезду
  #- Отцеплять вагоны от поезда
  #- Перемещать поезд по маршруту вперед и назад
  #- Просматривать список станций и список поездов на станции

end

menu = Menu.new
menu.run
