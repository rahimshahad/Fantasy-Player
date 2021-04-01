class UserController < ApplicationController

    get '/signup' do

        erb :'/users/new_user'
    end

   post '/signup' do
    if params[:users][:password] == params[:users][:password_confirmation] && params[:users][:email] && params[:users][:username]
        @user = User.new(params[:users])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            redirect to "/signup"
        end
    else
        redirect to "/signup"
    end
end

end
