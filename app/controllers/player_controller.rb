class PlayerController < ApplicationController
    get '/players' do
        # if current_user
            @player = Player.all
        # end
        erb :"/players/index"
    end

    #new

    get '/players/new' do
        
        erb :'/players/new'
    end

    #create
    post '/players' do
        @player = Player.new(params[:players])
        # @player.id = session[:user_id]
        @player.save
        redirect to "/players/#{@player.id}"
    end
   
   
    #show
    get 'players/:id' do

        erb :'/players/show'
    end

    #edit 
    get 'players/:id/edit' do

        erb :'/players/edit'

    end

    #update
    patch 'players/:id' do

    end

    #delete
    get '/players/:id/delete' do

    end
end