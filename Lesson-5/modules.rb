module Company
  attr_accessor :company_name

  def company_add
    puts "Укажите название компании"
    company = gets.chomp
    company_name_add(company)
  end

  def company_name_add(company)
    self.company_name = company
  end
  
  def company_name_show
    puts "Название компании <<#{self.company_name}>>"
  end
end