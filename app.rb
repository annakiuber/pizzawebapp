require "sinatra"
enable :sessions
require_relative "pizzamachine.rb"


get "/" do
	erb :index
end


post "/get_first_name" do
  session[:first_name] = params[:first_name]
  puts "first name here #{session[:first_name]}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  redirect "/pizzapageform1?="
end

get "/pizzapageform1" do
  erb :p001pizzapage, locals:{first_name: session[:first_name]}
end

post "/pizzapageform1" do
	session[:pizza_number] = params[:pizza_number]
	session[:selectpizzasize] = params[:selectpizzasize]
	session[:selectcrust] = params[:selectcrust]
	redirect "/toppings?="
end

get '/toppings' do
  erb :p002pizzapage, locals:{first_name: session[:first_name], pizza_number: session[:pizza_number], selectpizzasize: session[:selectpizzasize], selectcrust: session[:selectcrust]}
end
#
#
post '/toppings' do
	session[:selectveggienumber] = params[:selectveggienumber]
  session[:selectveggies] = params[:selectveggies]
	session[:newmeatnumber] = params[:newmeatnumber]
  session[:selectmeats] = params[:selectmeats]
	session[:yesnoextracheese] = params[:yesnoextracheese]
  redirect "/sides?="
	puts "This is new veggie number #{session[:newveggienumber]}!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts "This is the veggie you selected #{session[:selectveggies]}!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end
get '/sides' do
  "Hello World"
end
#
# get '/veggies' do
# 	session[:veggienumber] = params[:veggienumber]
# 	session[:veggies] = params[:veggies]
#   session[:meats] = params[:meats]
#   erb :p002pizzapage, locals:{first_name: session[:first_name]}
# end
