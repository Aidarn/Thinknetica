require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
puts "Menu"

class Menu
  def initialize
    @trains = []
    @routes = []
    @stations = []
  end

  #- Создавать поезда

  #- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  #- Назначать маршрут поезду
  #- Добавлять вагоны к поезду
  #- Отцеплять вагоны от поезда
  #- Перемещать поезд по маршруту вперед и назад
  #- Просматривать список станций и список поездов на станции
end

menu = Menu.new
menu.run
