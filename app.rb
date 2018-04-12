require "sinatra"

require_relative "pizzamachinepretotalpage.rb"
require_relative "totalfunction.rb"

enable :sessions

order_hash = {}
pizza_hash = {}

def troubleshoot
	puts "this is #{session[:pizza_hash]}!!!!!!!!!!!!!!!!!!!!!!*******"
	p session[:order_hash]
end
get "/" do
	troubleshoot
	session[:final_order] = []
	erb :index
end


post "/get_first_name" do
	troubleshoot
  session[:first_name] = params[:first_name]
  puts "first name here #{session[:first_name]}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  redirect "/pizzapageform1?="
end

get "/pizzapageform1" do
	troubleshoot
     size = size()
		 crust = crust()
		 sauces = sauces()
		 session[:pizza_hash] = {}
		 session[:order_hash] = {}
  erb :p001pizzapage, locals:{first_name: session[:first_name], size:size , crust:crust, sauces:sauces}
end

post "/pizzapageform1" do
	troubleshoot
	session[:pizza_number] = params[:pizza_number]
	session[:selectpizzasize] = params[:selectpizzasize]
	session[:selectcrust] = params[:selectcrust]
	session[:selectsauce] = params[:selectsauce]
	session[:pizza_hash]["selectpizzasize"] = session[:selectpizzasize]
	session[:pizza_hash]["selectcrust"] = session[:selectcrust]
	puts "This is the order hash after del #{session[:pizza_hash]}"
	redirect "/toppings?="
	# need if statement for reirect if 0 pizza
end

get '/toppings' do
	troubleshoot
	veggies = veggies()
	meats = meats()
  erb :p002pizzapage, locals: {veggies:veggies, meats:meats}
end
#
#
post '/toppings' do
	troubleshoot
  session[:selectveggies] = params[:selectveggies]
  session[:selectmeats] = params[:selectmeats]
	session[:yesnoextracheese] = params[:yesnoextracheese]
	session[:pizza_hash]["meats"] = session[:selectmeats]
	session[:pizza_hash]["veg"] = session[:selectveggies]
	session[:pizza_hash]["yesnoextracheese"] = session[:yesnoextracheese]
	puts """
$$$$$$$$$$$$$$$$$$$$$$$
#{session[:pizza_hash]}
$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	"""
	puts "This is new veggie number #{session[:newveggienumber]}!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts "This is the veggie you selected #{session[:selectveggies]}!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		redirect "/confirmandaddpizza"
end

get '/confirmandaddpizza' do
	troubleshoot
	"Hello Work"
	erb :p003pizzapage #locals: {order_hash: session[:order_hash], pizza_hash: session[:pizza_hash]}

end
post '/confirmandaddpizza' do
	troubleshoot
	session[:confirmpizza] = params[:confirmpizza]
	session[:addanotherpizza] = params[:addanotherpizza]
	puts "this is confirmpizza #{session[:confirmpizza]}"
	puts "this is addanotherpizza #{session[:addanotherpizza]}"
	if session[:confirmpizza] == "Yes" && session[:addanotherpizza] == "Yes"
		puts "this is #{session[:pizza_hash]}!!!!!!!!!!!!!!!!!!!!!!*******"
		p session[:order_hash]
		session[:final_order] << session[:pizza_hash]
			redirect '/pizzapageform1'


	elsif session[:confirmpizza] == "No" && session[:addanotherpizza] == "Yes"
		session[:pizza_hash].clear
		p session[:order_hash]
		redirect '/pizzapageform1'
	elsif session[:confirmpizza] == "Yes" && session[:addanotherpizza] == "No"
		session[:final_order] << session[:pizza_hash]
		p session[:order_hash]
		redirect '/sides'
	elsif session[:confirmpizza] == "No" && session[:addanotherpizza] == "No"
	session[:pizza_hash].clear
	p session[:order_hash]
		redirect "/"
end
end

get '/sides' do
	troubleshoot
	wings = wings()
	saladsforwebapp = saladsforwebapp()
	erb :p004pizzapage
end

 post '/sides' do
	 troubleshoot
	 session[:yesnowings] = params[:yesnowings]
	 session[:selectwings] = params[:selectwings]
	 session[:yesnosalad] = params[:yesnosalad]
	 session[:selectsalads] = params[:selectsalads]
	 session[:order_hash]["yesnowings"] = session[:yesnowings]
	 session[:order_hash]["yesnosalad"] = session[:yesnosalad]
	 puts "this is what you picked: #{session[:yesnowings]},
	  #{session[:selectwings]}, #{session[:yesnosalad]}, #{session[:selectsalads]}"
	 redirect "/drinkanddesserts?="
 end

 #need to add if/else statement for redirect fo sides.

 get '/drinkanddesserts' do
	 troubleshoot
	 erb :p005pizzapage
 end

 post '/drinkanddesserts' do
	 troubleshoot
	 session[:yesnodrinks] = params[:yesnodrinks]
	 session[:selectdrinks] =  params[:selectdrinks]
	 session[:yesnoicecream] = params[:yesnoicecream]
	 session[:order_hash]["yesnodrinks"] = session[:yesnodrinks]
	 session[:order_hash]["yesnoicecream"] = session[:yesnoicecream]
 	redirect "/deliveryform?="

 end

 get '/deliveryform' do
	 troubleshoot
  erb :p006pizzapage
end

post '/deliveryform' do
	troubleshoot
	session[:yesnodelivery] = params[:yesnodelivery]
	session[:address] = params[:address]
	session[:yesnotip] = params[:yesnotip]
	session[:tipamount] = params[:tipamount]
	session[:order_hash]["yesnodelivery"] = session[:yesnodelivery]
	session[:order_hash]["yesnotip"] = session[:yesnotip]
	session[:order_hash]["tipamount"] = session[:tipamount]
	redirect "/confirmfinalorder?="
end

get '/confirmfinalorder' do
	troubleshoot
	puts """
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	#{session[:order_hash]}
	"""
	session[:final_order] << session[:order_hash]
	p "This is the final order #{session[:final_order]}"
	# order_hash = {"yesnodelivery"=>"Yes", "yesnotip"=>"Yes", "tipamount"=>"20"}
	erb :p007pizzapage, locals:{order_hash: session[:order_hash], final_order: session[:final_order]}
end

post '/confirmfinalorder' do
	troubleshoot
	session[:yesnoconfirmorder] = params[:yesnoconfirmorder]
	if session[:yesnoconfirmorder] = "yes"
		puts "your total price is #{session[:final_order]}!!!!!!!!!!!!!!!!"
		redirect "/final_total_end?="
	else
			redirect "/"
		end
		puts "your total price is #{session[:final_order]}!!!!!!!!!!!!!!!!"
	end


	get '/final_total_end' do
		troubleshoot
		session[:final_total] = totalpricefunction(session[:final_order])
  "Hello World"
	erb :p008pizzapage, locals:{final_order: session[:final_order]}
end

post '/final_total_end' do
	troubleshoot
	session[:final_total] = params[:final_total]
	puts "your total price is #{session[:final_total]}!!!!!!!!!!!!!!!!"
	redirect "/"

end
