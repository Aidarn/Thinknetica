cart = {}
final_price = 0
puts "Чтобы остановить ввод названия, цен и колличества товаров напишите <<stop>> на вводе названия"
loop do
  puts "Введите навание товара"
  product = gets.chomp
  break if product == 'стоп' || product == 'stop'
  puts "Введите цену за товар"
  price = gets.chomp.to_f
  puts "Введите колличество товара"
  volume = gets.chomp.to_f
  cart[product] = { price: price, volume: volume }
end
puts "Корзина: #{cart}"
cart.each do |name, quantity|
  sum = quantity[:price] * quantity[:volume]
  puts "Цена за товар: #{name} - #{sum}"
  final_price += sum 
end
puts "Цена за весь товар: #{final_price}"  