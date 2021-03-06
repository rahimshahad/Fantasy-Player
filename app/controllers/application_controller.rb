require './config/environment'
 require 'sinatra/flash'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
     enable :sessions
     set :session_secret,  "secret"
      register Sinatra::Flash
  end

  get '/' do

    erb :index
  end 

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 

    def logged_in?
      !!current_user
    end

  end



end
