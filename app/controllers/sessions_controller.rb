class SessionsController < ApplicationController
    get "/login" do
        
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:users][:email])
        if @user && @user.authenticate(params[:users][:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            redirect to "/login"
        end
    end

    get "/logout" do 
        session.destroy
        redirect to "/signup"
    end

    get "/users/:id" do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

end
