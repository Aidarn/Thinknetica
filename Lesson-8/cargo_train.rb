# frozen_string_literal: true

class CargoTrain < Train
  TYPE = :cargo
  @numbers = []

  def initialize(number)
    super(number, TYPE)
  end
end
