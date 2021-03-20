module Filler
  def fill_test
    5.times do
      train_name = [*('A'..'Z'),*('0'..'9')].sample(5).join
      train_type = rand(1..2)
      raise StandardError, "Выбран неверный тип поезда" if train_type != 1 && train_type != 2
      trains.push CargoTrain.new(train_name) if train_type == 1
      trains.push PassengerTrain.new(train_name) if train_type == 2
    end
    
    puts "Созданы тестовые поезда"

    10.times do
      station_name = [*('A'..'Z'),*('0'..'9')].sample(rand(3..6)).join
      stations << station = Station.new(station_name)
    end

    puts "Созданы тестовые станции"

    5.times do
      first_station = rand(1..9)
      last_station = rand(1..9) if last_station != first_station 
      routes << Route.new(stations[first_station], stations[last_station])
    end

    puts "Созданы маршруты"

    10.times do
      station_number = rand(1..9)
      route_number = rand(1..4)
      routes[route_number].add_station(stations[station_number])
    end

    puts "Станции в маршруты добавленны"

    4.times do
      train_number = 0
      route_number = rand(0..10)
      trains[train_number].add_route(routes[route_number])
      train_number += 1
    end

    puts "Маршруты успешно добавлены"

    10.times do
      train_number = rand(0..4)
      wagon = CargoWagon.new(CargoWagon::TYPE) if trains[train_number].type == :cargo
      wagon = PassengerWagon.new(PassengerWagon::TYPE) if trains[train_number].type == :passenger
      trains[train_number].add_wagon(wagon)
    end
  end
end