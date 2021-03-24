# frozen_string_literal: true

class PassengerTrain < Train
  TYPE = :passenger
  @numbers = []

  def initialize(number)
    super(number, TYPE)
  end
end
