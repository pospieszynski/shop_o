class ShopBasket

  attr_accessor :basket, :warehouse

  def initialize warehouse
    @warehouse = warehouse
    @basket = []
  end

  def add name
    product = warehouse.fetch name
    (product) ? basket <<(product) : product # if product exist add it to the basket
  end

  def remove name
    index = basket.index { |x| x.name == name }
    if index
      warehouse.back name
      basket.delete_at(index)
    end
  end

  def price_brutto
    price_netto * 1.23
  end

  def price_netto
    basket.reduce(0) { |sum, n| sum + n.price }
  end

  def receipt
    puts "*******************"
    puts "*BIEDRONKA*\n"
    puts "*******************"

    unique = basket.group_by { |product| product.name }

    unique.each do |k, v|
      puts "#{k} -- #{v.count} szt.---  #{v.first.price} zł\n"
    end
    puts "*******************"
    puts "Total brutto --> #{price_brutto} zł \n"
    puts "Total netto --> #{price_netto} zł\n"
    puts "===================\n\n"
    puts "Thank you for shopping, see you soon!"
  end
end
