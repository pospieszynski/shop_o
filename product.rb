class Product

  attr_accessor :id, :name, :price

  @@id_max = 0 # automatically generate unique id
  def initialize name, price
    @id = @@id_max += 1
    @name = name
    @price = price
  end
end