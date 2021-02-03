alphabet =* ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
hash = {}
alphabet.each.with_index(1) do |letter, number|
  if vowels.include? (letter)
    hash [letter] = number 
  end
end
puts hash