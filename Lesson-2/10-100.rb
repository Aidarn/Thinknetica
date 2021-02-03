array = []
for i in 0..100
  next if i % 5 !=0 || i<10
  array.push i
end
print array