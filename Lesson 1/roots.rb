puts "Введите первое число"
  a = gets.chomp
puts "Введите второе число"
  b = gets.chomp
puts "Введите третье число"
  c = gets.chomp
  k = -1
  D = (b.to_i**2.0) - (4*a.to_i*c.to_i)
  if D > 0 
    C = Math.sqrt(D.to_i)
    root1 = (k*b.to_i + C.to_i)/(2*a.to_i)
    root2 = (k*b.to_i - C.to_i)/(2*a.to_i)
    puts "Дискриминант равен: #{D} и имеет корни #{root1} и #{root2}"
  elsif D < 0
    puts "Дискриминант равен: #{D} и не имеет корней"
  elsif D==0
    C = Math.sqrt(D.to_i)
    root3 = (-b.to_i + C.to_i)/(2*a.to_i)
    puts "Дискриминант равен: #{D} и имеет 2 одиннаковых корня #{root3}"
  end
