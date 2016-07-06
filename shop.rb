require_relative './shop_basket.rb'
require_relative './warehouse.rb'
require_relative './product.rb'

basket = ShopBasket.new(WareHouse.new({Product.new("milk", 5) => 9, Product.new("bread", 6) => 9}))
30.times { basket.add "milk"; basket.add "bread" }
30.times { basket.remove("milk") }
basket.receit

