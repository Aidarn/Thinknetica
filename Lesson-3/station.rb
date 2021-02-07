class Station

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end 

  def add_train(train)
    trains < train
  end

  def delet_train(train)
    trains.delet(train)
  end

  def cargo_trains(train)
    trains.select { |train| train.type == :cargo }
  end

  def passenger_trains(train)
    trains.select { |train| train.type == :passenger }
  end
end