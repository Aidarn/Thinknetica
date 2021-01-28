puts "Для определения типа треуголника введите длинны его сторон"
puts "Введите первое число"
  a = gets.chomp
puts "Введите второе число"
  b = gets.chomp
puts "Введите третье число"
  c = gets.chomp
if
  a.to_i-b.to_i==0 && a.to_i - c.to_i==0
    puts "Этот треугольник равносторонний"
  elsif
    a==b || a==c || b==c 
    puts "Этот треугольник равнобедренный"
  elsif
    (c.to_i*c.to_i) == (a.to_i*a.to_i + b.to_i*b.to_i)
      puts "Это прямой треугольник"
    elsif a.to_i**2 == c.to_i**2 + b.to_i**2
      puts "Это прямой треугольник"
    elsif b.to_i**2 == c.to_i**2 + a.to_i**2
      puts "Это прямой треугольник"
    else puts "Это обычный треугольник"
  end