puts "Привет, как тебя зовут?"
  name = gets.chomp
puts "А какой у тебя рост?"
  height = gets.chomp
  weight = (height.to_i - 110) * 1.15
  if weight > 0
    puts "#{name}, твой идеальный вес примерно #{weight}"
  else 
    puts "#{name}, Ваш вес уже оптимальный"
  end
  