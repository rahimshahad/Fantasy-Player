class PlayerController < ApplicationController

    

    #index
    get '/players' do

        erb :"players/index"
    end

    #new

    get '/players/new' do
        
        erb :'/players/new'
    end

    #create
    post '/players' do
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