# frozen_string_literal: true

class PassengerWagon < Wagon
  TYPE = :passenger
  attr_accessor :total_seats_number
  attr_reader :available_seats

  attr_writer :occupied_seats_number

  def initialize(total_seats_number)
    super(TYPE)
    @total_seats_number = total_seats_number
    @occupied_seats_number = 0
    @available_seats_number = total_seats_number
  end

  def take_a_seat
    if @occupied_seats_number < total_seats_number
      @occupied_seats_number += 1
      @available_seats_number -= 1
    else
      puts 'Все места заняты'
    end
  end

  def available_seats_number
    puts @available_seats_number.to_s
  end

  def occupied_seats_number
    puts @occupied_seats_number.to_s
  end
end
