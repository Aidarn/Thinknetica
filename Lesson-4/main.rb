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
  1-Создать поезд, маршрут, станцию
  here

  CREATE = <<~here
  1-Создать поезд
  2-Создать маршрут
  3-Создать Станцию
  here
  
  #- Создавать поезда
  def create_train
    #создать поезд по название
    #определить тип
    #добавить поезд
  end
  #- Создать станцию
  def create_station
    #Ввод названия станции
    #Добавление станции
  end
  #- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  def create_route
    #Найти станции
    #Определить порядок
    #Создать маршрут
  end
  #- Назначать маршрут поезду
  #- Добавлять вагоны к поезду
  #- Отцеплять вагоны от поезда
  #- Перемещать поезд по маршруту вперед и назад
  #- Просматривать список станций и список поездов на станции
def run
  puts MENU
end

end

menu = Menu.new
menu.run
