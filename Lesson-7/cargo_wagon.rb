class CargoWagon < Wagon
  TYPE = :cargo
  attr_accessor :total_volume, :remaining_volume, :occupied_volume

  def initialize(total_volume)
    @total_volume = total_volume
    @occupied_volume = 0
    @remaining_volume = total_volume
  end

  def fill_add(fill)
    if @remaining_volume != 0
      @remaining_volume = @remaining_volume - fill
      @occupied_volume = @occupied_volume + fill
    else
      puts "Вагон полон"
    end
  end

  def remaining_volume
    puts "Осталось места: #{@remaining_volume}" 
  end

  def occupied_volume
    puts "Занято места: #{@occupied_volume}"
  end
end