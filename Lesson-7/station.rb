class Station
  include InstanceCounter
  include Validation
  attr_reader :name, :trains
  attr_writer :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    name.downcase!
    name.capitalize!
    @name = name
    @@stations << self
    @trains = []
    register_instance
    validate!
  end 

  def add_train(train)
    trains << train
  end

  def delete_train(train)
    trains.delete(train)
  end

  def cargo_trains
    trains.select { |train| train.type == :cargo }
  end

  def passenger_trains
    trains.select { |train| train.type == :passenger }
  end

  def iterate_through_trains
    yield(trains) if block_given?
  end

  private

  def validate!
    raise "Название не может быть пустым" if name.nil?
    raise "Название должно быть строкой" if name.class != String
    raise "Название должно иметь больше 3 знаков" if name.length < 3
  end
end