require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb (:'super_hero')
  end

  post '/teams' do
    @team = params[:team]
    params[:team][:member].each do |members|
      Team.new(name: members[:name], power: members[:power], bio: members[:bio])
    end
    @members = Team.all
    erb (:'team')
  end

end
