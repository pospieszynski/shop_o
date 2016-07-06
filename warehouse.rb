class WareHouse

  attr_accessor :products

  def initialize products # container for Product => Quantity pairs
    @products = products
  end

  def fetch name
    if product_index = available?(name)
    	products.delete_at( product_index )
    end
  end

  def back product # put product back to the warehouse
  	products << product 
  end

  private
  def available? name
    unless name.nil?
    	product_index = products.index { |a| a.name == name }
    end
  end
end	