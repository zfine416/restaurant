class Party < ActiveRecord::Base
	has_many :orders
	has_many :foods, through: :orders

	def calculate_bill
		sum = 0
		self.foods.each do |item|
			sum = sum + item.price
		end
		return sum
	end

	def retreive_order_id
		self.orders.each do |item|
			item.id
		end
	end

	def food_name
		self.foods.map do |item|
			item.name
		end
	end
end

