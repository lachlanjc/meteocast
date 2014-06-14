require 'sinatra'
require 'erb'

get '/' do
  erb :navigator
end

get '/hello' do
  erb :navigator
end

get '/help' do
  erb :navigator
end

get '/weather' do
  @current = "overcast"
  @current_temp = 60
  @tomorrow = "sunny"
  @tomorrow_temp = 73
  erb :weather
end
