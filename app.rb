require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require "./lib/startup_weekend"
require "pry"
require "./lib/member"

get('/') do
  @list = Team.all()
  erb(:index)
end

post ('/teams') do
  @list = Team.all() #@list is relevant outside of this block
  name = params.fetch("name") #note: fetching from our form on erb(:index)
  team = Team.new(name) #this variable is only relevant inside of this block so that it understands the process. cd as defined here (without @) is meaningless outside of this block for all intents and purposes.
  team.save()
  erb(:index) #originally, we had this going to a erb(:success) page but this is redundant. Now keeps all within index.
end

post ('/member') do
  @team = Team.find(params.fetch("team_id").to_i())
  member_name = params.fetch("member_name")
  member = Member.new(member_name)
  member.save()
  @team.add_member(member)
  erb(:teams)
end

get ('/teams/:id') do
  @team = Team.find(params.fetch('id').to_i())
  erb(:teams)
end
