# frozen_string_literal: true

module Filler
  def filler_start
    puts 'Началось наполнение обьектами'
    filler_action = 0
    loop do
      break if filler_action > 4

      case filler_action
      when 0
        create_test_trains
        puts 'Созданы тестовые поезда'
        filler_action += 1
      when 1
        create_test_station
        puts 'Созданы тестовые станции'
        filler_action += 1
      when 2
        create_test_routes
        puts 'Созданы маршруты'
        filler_action += 1
      when 3
        create_test_wagons
        puts 'Вагоны успешно добавлены'
        filler_action += 1
      when 4
        set_test_routes
        puts 'Маршруты успешно добавлены'
        filler_action += 1
      end
    end
  end

  def create_test_trains
    5.times do
      train_name = [*('A'..'Z'), *('0'..'9')].sample(5).join
      train_type = rand(1..2)
      raise StandardError, 'Выбран неверный тип поезда' if train_type != 1 && train_type != 2

      trains.push CargoTrain.new(train_name) if train_type == 1
      trains.push PassengerTrain.new(train_name) if train_type == 2
    end
  end

  def create_test_station
    10.times do
      station_name = [*('A'..'Z'), *('0'..'9')].sample(rand(3..6)).join
      stations << Station.new(station_name)
    end
  end

  def create_test_routes
    6.times do
      first_station = rand(1..9)
      last_station = rand(1..9) if last_station != first_station
      routes << Route.new(stations[first_station], stations[last_station])
    end

    10.times do
      station_number = rand(1..9)
      route_number = rand(1..4)
      routes[route_number].add_station(stations[station_number])
    end
  end

  def create_test_wagons
    20.times do
      train_number = rand(0..4)
      case trains[train_number].type
      when :cargo
        total_volume = rand(1000..9000)
        wagon = CargoWagon.new(total_volume)
      when :passenger
        total_seats_number = rand(20..70)
        wagon = PassengerWagon.new(total_seats_number)
      end
      trains[train_number].add_wagon(wagon)
    end
  end

  def set_test_routes
    train_number = 0

    4.times do
      route_number = rand(0..5)
      trains[train_number].add_route(routes[route_number])
      train_number += 1
    end
  end
end
