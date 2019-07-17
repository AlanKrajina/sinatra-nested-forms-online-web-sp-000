require './environment'

module FormsLab
  class App < Sinatra::Base

  get '/' do
    "Welcome to the Nested Forms Lab!"
  end
  
  get '/new' do
    erb :'pirates/new'
  end
  

  
  post '/pirates' do
  @pirate = Pirate.new(params[:pirate]) 

  params[:pirate][:ships].each do |details|
    Ship.new(details)                     
  end
 
  @ships = Ship.all                     
 
  erb :'pirates/show'
end

  end
end


[1] pry(#<FormsLab::App>)> @pirate = Pirate.new(params[:pirate])
=> <Pirate:0x0000000002ce36a8 @height="95", @name="Ian", @weight="165">

[2] pry(#<FormsLab::App>)> params[:pirate] or params
=> {"name"=>"Ian",
 "weight"=>"165",
 "height"=>"95",
 "ships"=>
  [{"name"=>"Titanic", "type"=>"Steam Liner", "booty"=>"Silver"},
   {"name"=>"Carpathia", "type"=>"Rescue Ship", "booty"=>"Inner Tubes"}]}

[3] pry(#<FormsLab::App>)> params[:pirate][:ships]
=> [{"name"=>"Titanic", "type"=>"Steam Liner", "booty"=>"Silver"},
 {"name"=>"Carpathia", "type"=>"Rescue Ship", "booty"=>"Inner Tubes"}]