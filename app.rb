require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require "./lib/cd"
require "pry"

get('/') do
  @list = Team.all()
  erb(:index)
end
