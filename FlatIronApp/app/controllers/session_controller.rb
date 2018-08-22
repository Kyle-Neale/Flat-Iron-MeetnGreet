class SessionController < ApplicationController

  def login

  end

  def create

    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else

      redirect_to login_path
    end
  end


end
