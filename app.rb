Dir["models/*.rb"].each do |file|
  require_relative file
end

class Restaurants < Sinatra::Base
	register Sinatra::ActiveRecordExtension

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

	patch "/foods/:id" do
		foods = Food.edit(params[:foods])
		redirect to "/foods/#{foods.id}"
	end

	delete "/foods/:id" do
		foods = Food.delete(params[:foods])
		redirect to "/foods"
	end

	get "/orders" do
		@orders = Order.all
		erb :"orders/index"
	end

	get "/orders/new" do
		@foods = Food.all
		@partys = Party.all
		erb :"orders/new"
	end

	post "/orders" do
		orders = Order.create(params[:orders])
		redirect to "/orders/#{orders.id}"
	end

	get "/orders/:id" do |id|
		@orders = Order.find(id)
		erb :"orders/show"
	end

	get "/orders/:id/edit" do |id|
		@orders = Order.find(id)
		erb :"orders/edit"
	end

	patch "/orders/:id" do
		orders = Order.edit(params[:orders])
		redirect to "/orders/#{orders.id}"
	end

	delete "/orders/:id" do
		orders = Order.delete(params[:orders])
		redirect to "/orders"
	end

end