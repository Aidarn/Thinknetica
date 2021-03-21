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

    6.times do
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

    puts "Станции в маршруты добавлены"

    20.times do
      train_number = rand(0..4)
      if trains[train_number].type == :cargo
        total_volume = rand(1000..9000)
        wagon = CargoWagon.new(total_volume)
      elsif trains[train_number].type == :passenger
        total_seats_number = rand(20..70)
        wagon = PassengerWagon.new(total_seats_number)
      end
      trains[train_number].add_wagon(wagon)
    end

    puts "Вагоны успешно добавлены"
    
    train_number = 0

    4.times do
      route_number = rand(0..5)
      trains[train_number].add_route(routes[route_number])
      train_number += 1
    end

    puts "Маршруты успешно добавлены"
  end
end