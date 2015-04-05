require "sinatra"
require "erb"
require "yahoo_weatherman"

get "/" do
  erb :home
end

post "/" do
  client = Weatherman::Client.new :unit => "F"
  response = client.lookup_by_location(params[:zipcode])
  @current = response.condition["text"]
  @current_temp = response.condition["temp"]
  @tomorrow = response.forecasts.first["text"]
  @tomorrow_temp = response.forecasts.first["high"]

  @city = response.location["city"]
  @region = response.location["region"]
  @region = response.location["country"] if @region == ""

  erb :weather
end
