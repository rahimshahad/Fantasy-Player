class PlayerController < ApplicationController
    #INDEX
    get '/players' do
        if current_user
            @player = Player.all
            @user = User.all
            erb :"/players/index"
        end
    end
    
    
    #new
    get '/players/new' do
        
        erb :'/players/new'
    end

    #create
    post '/players' do
        if params[:players][:name] == "" || params[:players][:position] == "" || params[:players][:nationality] == "" || params[:players][:pace] == "" || params[:players][:dribbling] == "" || params[:players][:defending] == "" || params[:players][:physical] == "" || params[:players][:nickname] == "" || params[:players][:passing] == "" || params[:players][:shooting] == ""
            redirect to "/players/new"
        else
            @player = Player.new(params[:players])
            @player.user_id = session[:user_id]
             @player.save
             redirect to "/players"
         end
    end
   
 
   
    #read
    get '/players/:id' do
        @player = Player.find(params[:id])
         erb :"/players/show"
    end

    #edit 
    get '/players/:id/edit' do
        @player = Player.find_by_id(params[:id])
          if @player.user == current_user
             erb :'/players/edit'
          else
        #     #  flash[:error] = "YOU CAN'T EDIT THIS ENTRY"
             redirect to "/players"
         end  

    end

    #update
    patch "/players/:id" do
        if params[:players][:name] == "" || params[:players][:position] == "" || params[:players][:nationality] == "" || params[:players][:pace] == "" || params[:players][:dribbling] == "" || params[:players][:defending] == "" || params[:players][:physical] == "" || params[:players][:nickname] == "" || params[:players][:passing] == "" || params[:players][:shooting] == ""
            redirect to "/players/#{params[:id]}}/edit"
        else
            @player = Player.find_by_id(params[:id])
            @player.update(params[:players])
            redirect to "/players/#{@player.id}"
        end
    end

    #delete
    delete "/players/:id/delete" do
        @player = Player.find_by_id(params[:id])
        if @player.user == current_user
            @player.delete
            redirect to "/players"
        else
       #     #  flash[:error] = "YOU CAN'T EDIT THIS ENTRY"
            redirect to "/players"
        end  
    end

end