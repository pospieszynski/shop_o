class ShopBasket

attr_accessor :basket, :warehouse

	def initialize warehouse
	 	@warehouse = warehouse
	 	@basket = []
	end

	def add name
		product = warehouse.fetch name
		(product)? @basket <<(product) : product   # if product exist add it to the basket
	end

	def remove name
		index = basket.index{ |x| x.name == name }
		if index
			warehouse.back name
			basket.delete_at(index)
		end
	end

	def price_brutto
		price_netto * 1.23
	end

	def price_netto
		basket.inject(0){ |sum, n| sum + n.price }
	end

	def receit
		puts "*******************"
		puts "*BIEDRONKA*\n"
		puts "*******************"
		
		unique = Hash[basket.group_by {|x| x }.map {|k,v| [k,v.count]}]

		unique.each do |product, quantity| 
			puts "#{product.name} -- #{quantity} szt.---  #{product.price} zł\n"
		end
		puts "*******************"
		puts "Total brutto --> #{price_brutto} zł \n"
		puts "Total netto --> #{price_netto} zł\n"
		puts "===================\n\n"
		puts "Thank you for shopping, see you soon!"
	end
end
