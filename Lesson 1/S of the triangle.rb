puts "Для нахождения площади треугольника:"
puts "Введите длинну основания треугольника"
  footing = gets.chomp
puts "И высоту треугольника"
  height = gets.chomp
  S = (1/2.0) * footing.to_i * height.to_i
puts "Площадь треугольника = #{S}"