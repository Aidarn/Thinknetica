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
  here

  CREATE = <<~here
  _________________
  1-Создать поезд
  2-Создать маршрут
  3-Создать Станцию
  here

  def run
    puts MENU
    action = gets.chomp.to_i
    selected_action(action)
  end
  
  def selected_action(action)
    if action == 1
      what_create(action)
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
  #- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  def create_route
    puts "Список станций:"
    stations.each_with_index {|index, station| puts "Номер: #{station}, Название: #{index.name}"}
    puts "Введите номера начальной и конечной станции для создания маршрута"
    routes <<
    #Создать маршрут
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
