class SessionsController < ApplicationController
    get "/login" do
        if !logged_in?
        erb :'users/login'
        else
            @user = User.find(session[:user_id])
            redirect to "/users/#{@user.id}"
        end
    end

    post '/login' do
        @user = User.find_by(email: params[:users][:email])
        if @user && @user.authenticate(params[:users][:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            flash[:error] = "Email and Password do not match"
            redirect to "/login"
        end
    end

    get "/logout" do 
        session.destroy
        redirect to "/"
    end

    get "/users/:id" do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

end
