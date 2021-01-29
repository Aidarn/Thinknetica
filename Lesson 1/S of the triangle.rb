puts "Для нахождения площади треугольника:"
puts "Введите длинну основания треугольника"
footing = gets.chomp.to_i 
puts "И высоту треугольника"
height = gets.chomp.to_i
s = (1/2.0) * footing * height
puts "Площадь треугольника = #{s}"
