class WareHouse

attr_accessor :products_count

	def initialize products_hash	# container for Product => Quantity pairs
	 @products_count = products_hash
	end

	def fetch name 
		product =  @products_count.keys.find{ |a| a.name == name}
		if available? product
			@products_count[product] -= 1 
			product 
		end
	end

	def back name # put product back to the warehouse
		product =  @products_count.keys.find{ |a| a.name == name}
		@products_count[product] += 1
	end

private
	def available? product
		unless product.nil?
			products_count[product] > 0 				
		end
	end
end