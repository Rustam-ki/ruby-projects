module CompanyName
  attr_accessor :company

  def company
    puts "Введите название компании?"
    @company = gets.chomp
  end
end