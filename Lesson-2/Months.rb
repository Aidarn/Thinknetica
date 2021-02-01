months = {
  "January" => 31, "February" => 28, "March" => 31, "April" => 30, "May" => 31, "June" => 30,
  "July" => 31, "August" => 31, "September" => 30, "October" => 31, "November" => 31, "December" => 31
}
months.each { |mouth, days| 
  if days == 30
  puts mouth
  end 
  }