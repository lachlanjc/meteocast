require 'sinatra'
require 'erb'
require 'yahoo_weatherman'

get '/' do
  erb :home
end

get '/help' do
  erb :navigator
end

post '/' do
  zipcode = params[:zipcode]
  client = Weatherman::Client.new :unit => 'F'
  response = client.lookup_by_location(zipcode)
  @current = response.condition['text']
  @current_temp = response.condition['temp']
  @tomorrow = response.forecasts.first['text']
  @tomorrow_temp = response.forecasts.first['high']
  @city = response.location['city']
  @region = response.location['region']
  
  if @region = ""
    @region = response.location['country']
  end
  
  erb :weather
end
