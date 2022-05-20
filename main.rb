require 'sinatra'
require 'bcrypt'

enable :sessions

require './db/db'

require './helpers/sessions_helper'

require './models/user'
require './models/agents'

require './controllers/users_controller'
require './controllers/sessions_controller'
require './controllers/agents_controller'

get '/' do
  redirect '/val_agents'
end
