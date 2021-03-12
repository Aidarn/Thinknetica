class Station
  attr_reader :name, :trains
  attr_writer :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @@stations << self
    @trains = []
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
end