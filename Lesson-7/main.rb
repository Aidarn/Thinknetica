require_relative 'interface'
require_relative 'modules'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'filler'

class Menu
  attr_accessor :trains, :routes, :stations, :stop
  
  include Filler 

  def initialize
    @trains = []
    @routes = []
    @stations = []
    @stop = 1
  end
  
  def run
    loop do
      if @stop == 0
        puts PROGRAMM_END
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
      trains.each_with_index {|train, number| puts "Номер:#{number}, Поезд:#{train.number}, Тип:#{train.type}, Кол-во вагонов: #{train.wagons_list.size}"}
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
      when 6 
        wagon_operation(train_number)
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
    when 5
      show_the_list_of_wagons_at_the_train
    when 6
      stop
    when 7
      fill_test
    end
  end
  
  def add_company
    trains.last.company_name_show
  end

  def create_train
    puts TRAIN_NUMBER_TYPE
    train_name = gets.chomp
    train_type = gets.chomp.to_i
    raise StandardError, "Выбран неверный тип поезда" if train_type != 1 && train_type != 2
    trains.push CargoTrain.new(train_name) if train_type == 1
    trains.push PassengerTrain.new(train_name) if train_type == 2
    puts DONE
    rescue StandardError => e
      puts e.message
      puts "Повторите попытку"
      retry
  end
  
  def create_station
    puts "Введите название станции"
    station_name = gets.chomp
    stations << station = Station.new(station_name)
  end
  
  def create_route
    if !stations.empty? && (stations.first != stations.last)
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
      puts DONE
    else
      puts NO_SUCH_OBJECTS
    end
  end

  def add_wagon_to_train(train_number)
    if trains[train_number].type == :cargo
      puts "Введите обьем вагона:"
      total_volume = gets.chomp.to_i
      wagon = CargoWagon.new(total_volume)
    elsif trains[train_number].type == :passenger
      puts "Введите количество мест в вагоне"
      total_seats_number = gets.chomp.to_i
      wagon = PassengerWagon.new(total_seats_number)
    end
    trains[train_number].add_wagon(wagon)
    puts DONE
    trains.each_with_index {|train, number| p "Текущее количество вагонов: #{train.wagons_list.size}"}
  end

  def remove_wagon_to_train(train_number)
    wagon = CargoWagon.new(CargoWagon::TYPE) if trains[train_number].type == :cargo
    wagon = PassengerWagon.new(PassengerWagon::TYPE) if trains[train_number].type == :passenger
    trains[train_number].remove_wagon(wagon)
    puts DONE
  end

  def wagon_operation(train_number)
    if trains[train_number].type == :cargo
      puts CHOICE
      trains[train_number].wagons_list.each_with_index do |wagon, index| 
      puts "Номер вагона #{index}"
      puts "  Объём: #{wagon.total_volume}, Занятый объем #{wagon.occupied_volume}"
      end
      wagon_number = gets.chomp.to_i
      puts "Укажите сколько места хотите занять"
      fill = gets.chomp.to_i
      trains[train_number].wagons_list[wagon_number].fill_add(fill)
    elsif trains[train_number].type == :passenger
      puts CHOICE
      trains[train_number].wagons_list.each_with_index do |wagon, index| 
      puts "Номер вагона #{index}" 
      puts "  Количество свободных мест: #{wagon.available_seats_number}"
      end
      wagon_number = gets.chomp.to_i
      trains[train_number].wagons_list[wagon_number].take_a_seat
    end
    puts DONE
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
    puts DONE
  end

  def delete_station_in_route(route_number)
    puts "Список станций в маршруте:"
    routes[route_number].station_list.each_with_index {|route, number| puts "Номер: #{number}, Название #{route.name}"}
    puts "Выберите номер станции для удаления"
    station_number = gets.chomp.to_i
    station = routes[route_number].station_list[station_number]
    routes[route_number].delete_station(station)
    routes[route_number].station_list.each_with_index {|route, number| puts "Номер: #{number}, Название #{route.name}"}
    puts DONE
  end
  
  def show_the_list_of_trains_at_the_station
    stations.each_with_index do |station, index|
      puts "На станции: #{station.name}"
      if !station.trains.empty?
        station.iterate_through_trains do |train, index| 
          puts "  Название поезда: #{train.number}"
          puts "    Тип поезда: <<#{train.type}>>"
          puts "    Количество вагонов: #{train.wagons_list.size}"
        end
      else
        puts "Поезда отсутствуют"
      end
    end
  end

  def show_the_list_of_wagons_at_the_train
      trains.each_with_index do |train, index|
        puts "На поезде: #{train.number}"
        if !train.wagons_list.empty?
          train.iterate_through_wagons do |wagon, index| 
            puts "  Номер вагона: #{index}"
            if train.type == :cargo
              puts "    Обьем вагона: #{wagon.total_volume}"
              puts "      Свободно: #{wagon.remaining_volume}, Занято: #{wagon.occupied_volume}" 
            elsif train.type == :passenger
              puts "    Обьем вагона: #{wagon.total_seats_number}"
              puts "      Свободно: #{wagon.available_seats_number}, Занято: #{wagon.occupied_seats_number}" 
            end
          end
        else
          puts "Вагоны отсутствуют"
        end
      end
  end

  def stop
    @stop = 0
  end
end

menu = Menu.new
menu.run