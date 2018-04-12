require "sinatra"

require_relative "pizzamachinepretotalpage.rb"
require_relative "totalfunction.rb"

enable :sessions

order_hash = {}
pizza_hash = {}


get "/" do
	erb :index
end


post "/get_first_name" do
  session[:first_name] = params[:first_name]
  puts "first name here #{session[:first_name]}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  redirect "/pizzapageform1?="
end

get "/pizzapageform1" do
     size = size()
		 crust = crust()
		 sauces = sauces()
  erb :p001pizzapage, locals:{first_name: session[:first_name], size:size , crust:crust, sauces:sauces}
end

post "/pizzapageform1" do
	session[:pizza_number] = params[:pizza_number]
	session[:selectpizzasize] = params[:selectpizzasize]
	session[:selectcrust] = params[:selectcrust]
	session[:selectsauce] = params[:selectsauce]
	pizza_hash["selectpizzasize"] = session[:selectpizzasize]
	pizza_hash["selectcrust"] = session[:selectcrust]
	puts "This is the order hash after del #{pizza_hash}"
	redirect "/toppings?="
	# need if statement for reirect if 0 pizza
end

get '/toppings' do
	veggies = veggies()
	meats = meats()
  erb :p002pizzapage, locals: {veggies:veggies, meats:meats}
end
#
#
post '/toppings' do
	session[:selectveggienumber] = params[:selectveggienumber]
  session[:selectveggies] = params[:selectveggies]
	session[:newmeatnumber] = params[:newmeatnumber]
  session[:selectmeats] = params[:selectmeats]
	session[:yesnoextracheese] = params[:yesnoextracheese]
	pizza_hash["selectveggienumber"] = session[:selectveggienumber]
	pizza_hash["newmeatnumber"] = session[:newmeatnumber]
	pizza_hash["yesnoextracheese"] = session[:yesnoextracheese]
	puts "This is new veggie number #{session[:newveggienumber]}!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts "This is the veggie you selected #{session[:selectveggies]}!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		redirect "/confirmandaddpizza"
end

get '/confirmandaddpizza' do
	"Hello Work"
	erb :p003pizzapage, locals: {order_hash: order_hash}

end
post '/confirmandaddpizza' do
	session[:confirmpizza] = params[:confirmpizza]
	session[:addanotherpizza] = params[:addanotherpizza]
	puts "this is confirmpizza #{session[:confirmpizza]}"
	puts "this is addanotherpizza #{session[:addanotherpizza]}"
	if session[:confirmpizza] == "Yes" && session[:addanotherpizza] == "Yes"
		redirect '/pizzapageform1'
	elsif session[:confirmpizza] == "No" && session[:addanotherpizza] == "Yes"
		pizza_hash.delete(pizza_hash)
		redirect '/pizzapageform1'
	elsif session[:confirmpizza] == "Yes" && session[:addanotherpizza] == "No"
		order_hash.merge(pizza_hash)
		redirect '/sides'
	else session[:confirmpizza] ++ "No" && session[:addanotherpizza] == "No"
		pizza_hash.delete(pizza_hash)
		redirect "/"
end
end

get '/sides' do
	wings = wings()
	saladsforwebapp = saladsforwebapp()
	erb :p004pizzapage



end

 post '/sides' do
	 session[:yesnowings] = params[:yesnowings]
	 session[:selectwings] = params[:selectwings]
	 session[:yesnosalad] = params[:yesnosalad]
	 session[:selectsalads] = params[:selectsalads]
	 order_hash["yesnowings"] = session[:yesnowings]
	 order_hash["yesnosalad"] = session[:yesnowings]
	 puts "this is what you picked: #{session[:yesnowings]},
	  #{session[:selectwings]}, #{session[:yesnosalad]}, #{session[:selectsalads]}"
	 redirect "/drinkanddesserts?="
 end

 #need to add if/else statement for redirect fo sides.

 get '/drinkanddesserts' do
	 erb :p005pizzapage
 end

 post '/drinkanddesserts' do
	 session[:yesnodrinks] = params[:yesnodrinks]
	 session[:selectdrinks] =  params[:selectdrinks]
	 session[:yesnoicecream] = params[:yesnoicecream]
	 order_hash["yesnodrinks"] = session[:yesnodrinks]
	 order_hash["yesnoicecream"] = session[:yesnoicecream]
 	redirect "/deliveryform?="

 end

 get '/deliveryform' do
  erb :p006pizzapage
end

post '/deliveryform' do
	session[:yesnodelivery] = params[:yesnodelivery]
	session[:address] = params[:address]
	session[:yesnotip] = params[:yesnotip]
	session[:tipamount] = params[:tipamount]
	order_hash["yesnodelivery"] = session[:yesnodelivery]
	order_hash["yesnotip"] = session[:yesnotip]
	order_hash["tipamount"] = session[:tipamount]
	redirect "/confirmationoftoppings?="
end

get '/confirmationoftoppings' do
	puts """
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	#{order_hash}
	"""
	# order_hash = {"yesnodelivery"=>"Yes", "yesnotip"=>"Yes", "tipamount"=>"20"}
	erb :p007pizzapage, locals:{order_hash: order_hash, pizza_number: session[:pizza_number]}
end

post '/confirmationoftoppings' do
	redirect "/final_total_end?="
end

get '/final_total_end' do
	pizza_number = session[:pizza_number]
	final_total = totalpricefunction(pizza_number, order_hash)
	puts "your total price is #{session[:final_total]}!!!!!!!!!!!!!!!!"
	erb :p008pizzapage, locals:{final_total:final_total}

end
