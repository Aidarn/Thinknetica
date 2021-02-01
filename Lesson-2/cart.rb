cart = {}
cart2 = {}
final_price = 0
final_price_final = 0
puts "Чтобы остановить ввод названия, цен и колличества товаров напишите <<стоп>> или <<stop>> "
loop do
  puts "Введите навание товара"
  product = gets.chomp
  break if product == 'стоп' || product == 'stop'
  puts "Введите цену за товар"
  price = gets.chomp.to_f
  puts "Введите колличество товара"
  volume = gets.chomp.to_f
  cart[product] = { price: price, volume: volume }
  cart2[product] = { _общая_цена_этого_товара: price*volume }
end
puts "Корзина: #{cart}"
puts "Цена за полное количество каждого товара: #{cart2}"
cart.each do |name, quantity|
  final_price = quantity[:price] * quantity[:volume]
  final_price_final += final_price
end
puts "Цена за весь товар:#{final_price_final}"