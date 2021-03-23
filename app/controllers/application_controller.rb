require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
     enable :sessions
  end

  get '/' do

    erb :index
end 

end
