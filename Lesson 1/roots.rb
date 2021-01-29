puts "Введите первое число"
a = gets.chomp.to_i
puts "Введите второе число"
b = gets.chomp.to_i
puts "Введите третье число"
c = gets.chomp.to_i
d = (b**2.0) - (4 * a * c)
if d > 0 
  c2 = Math.sqrt(d)
  root1 = (- b + c2)/(2 * a)
  root2 = (- b - c2)/(2 * a)
  puts "Дискриминант равен: #{d} и имеет корни #{root1} и #{root2}"
elsif d < 0
  puts "Дискриминант равен: #{d} и не имеет корней"
elsif d == 0
  c2 = Math.sqrt(d)
  root3 = (- b + c2)/(2 * a)
  puts "Дискриминант равен: #{d} и имеет 2 одиннаковых корня #{root3}"
end
