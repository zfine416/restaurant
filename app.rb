Dir["models/*.rb"].each do |file|
  require_relative file
end

class Restaurants < Sinatra::Base
	register Sinatra::ActiveRecordExtension
	enable :method_override

	#Console
	get "/console" do
		Pry.start(binding)
		""
	end 

	get "/" do
		erb :"static/index"
	end

	get "/foods" do
		@foods = Food.all
		# Pry.start(binding)
		erb :"foods/index"
	end

	get "/foods/new" do 
		erb :"foods/new"
	end

	post "/foods" do
		foods = Food.create(params[:foods])
		redirect to "/foods/#{foods.id}"
	end

	get "/foods/:id" do |id|
		@foods = Food.find(id)
		erb :"foods/show"
	end

	get "/foods/:id/edit" do |id|
		@foods = Food.find(id)
		erb :"foods/edit"
	end

	patch "/foods/:id" do |id|
		foods = Food.find(id)
		foods.update(params[:foods])
		redirect to "/foods/#{foods.id}"
	end

	delete "/foods/:id" do |id|
		foods = Food.find(id)
		foods.destroy
		redirect to "/foods"
	end

	get "/orders" do
		@parties = Party.all
		erb :"orders/index"
	end

	get "/orders/new" do
		@foods = Food.all
		@partys = Party.all
		erb :"orders/new"
	end

	post "/orders" do
		orders = Order.create(params[:orders])
		redirect to "/parties/#{orders.party_id}"
		# Pry.start(binding)
	end

	get "/orders/:id" do |id|
		@party = Party.find(id)
		# Pry.start(binding)
		erb :"orders/show"
	end

	get "/orders/:id/edit" do |id|
		@foods = Food.all
		@party = Party.find(id)
		# Pry.start(binding)
		erb :"orders/edit"
	end

	patch "/orders/:id" do |id|
		orders = Order.find(id)
		orders.update(params[:orders])
		redirect to "/orders/#{orders.id}"
	end

	delete "/orders" do
		# Pry.start(binding)
		foodid = (params[:food_id])
		partyid = (params[:party_id])
		Order.where("food_id=#{foodid} AND party_id=#{partyid}").first.destroy
		# order.destroy
		redirect to "/parties/#{partyid}"
	end

	get "/parties" do
		@parties = Party.all
		erb :"partys/index"
	end

	get "/parties/new" do
		@parties = Party.all
		erb :"partys/new"
	end

	post "/parties" do
		parties = Party.create(params[:parties])
		redirect to "/parties/#{parties.id}"
	end

	get "/parties/:id" do |id|
		@party = Party.find(id)
		@foods = Food.all
		# Pry.start(binding)
		erb :"partys/show"
	end

	get "/parties/:id/edit" do |id|
		@parties = Party.find(id)
		erb :"partys/edit"
	end

	patch "/parties/receipt" do
		# # Pry.start(binding)
		# # tip = (params[:])
		# orders.update(params[:orders])
		# redirect to "/orders/#{orders.id}"
	end

	patch "/parties/:id" do |id|
		parties = Party.find(id)
		parties.update(params[:parties])
		# Pry.start(binding)
	end

	delete "/parties/:id" do |id|
		party = Party.find(id)
		party.destroy
		redirect to "/parties"
	end

	get "/parties/:id/receipt" do |id|
		@party = Party.find(id)
		erb :"partys/receipt"
	end

	patch "/parties/:id/checkout" do |id|
		if params[:parties][:paid]=="true"
			redirect to "/parties/#{id}/receipt"
		end
		redirect to "/parties/#{parties.id}"
	end
	


end


