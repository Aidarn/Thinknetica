alphabet =* ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
hash = {}
alphabet.each.with_index(1) { |letter, number|
  if vowels.include? (letter)
    hash [letter] = number 
  end}
puts hash