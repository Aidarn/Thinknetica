days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts "Чтобы найти порядковый номер даты:"
puts "Введите число:"
day = gets.chomp.to_i
puts "Введите номер месяца:"
month = gets.chomp.to_i
puts "Введите год"
year = gets.chomp.to_i
days[1] = 29 if (( year % 4 == 0 && year % 100 == 0 ) || ( year % 400 == 0 ))
number = day
number = number + days.take( month - 1 ).sum 
puts "Порядковым номером даты: #{day}.#{month}.#{year} является #{number}"