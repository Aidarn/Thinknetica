# frozen_string_literal: true

class CargoWagon < Wagon
  TYPE = :cargo
  attr_accessor :total_volume, :remaining_volume, :occupied_volume

  def initialize(total_volume)
    super(TYPE)
    @total_volume = total_volume
    @occupied_volume = 0
    @remaining_volume = total_volume
  end

  def fill_add(fill)
    if @remaining_volume.zero?
      puts 'Вагон полон'
    else
      @remaining_volume -= fill
      @occupied_volume += fill
    end
  end

  def remaining_volume?
    puts @remaining_volume.to_s
  end

  def occupied_volume?
    puts @occupied_volume.to_s
  end
end
