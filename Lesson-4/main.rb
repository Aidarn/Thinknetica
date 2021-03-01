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

  #- Создавать поезда
  #- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  #- Назначать маршрут поезду
  #- Добавлять вагоны к поезду
  #- Отцеплять вагоны от поезда
  #- Перемещать поезд по маршруту вперед и назад
  #- Просматривать список станций и список поездов на станции
def run
  
end

end

menu = Menu.new
menu.run
