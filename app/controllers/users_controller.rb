class UsersController < ApplicationController
  def create
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect_to "/groups"
    else
      flash[:registration_errors] = user.errors.full_messages
      redirect_to '/main'
    end
  end
end
