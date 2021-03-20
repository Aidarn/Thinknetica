class PassengerWagon < Wagon
  TYPE = :passenger
  attr_reader :total_seats_number, :occupied_seats_number, :available_seats

  attr_writer :total_seats_number, :occupied_seats_number

  def initialize(total_seats_number)
    @total_seats_number = total_seats_number
    @occupied_seats_number = 0
    @available_seats_number = total_seats_number
  end

  def take_a_seat
    if @occupied_seats_number < total_seats_number
      @occupied_seats_number += 1
      @available_seats_number -= 1
    else
      puts "Все места заняты"
    end
  end

  def available_seats_number
    puts "Свободных мест: #{@available_seats_number}"
  end

  def occupied_seats_number
    puts "Занятых мест: #{@occupied_seats_number}"
  end
end