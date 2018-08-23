class SessionController < ApplicationController

  def login
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      return redirect_to user_path(@user)
    else
      if @user.nil?
        flash[:message] = "User does not exist"
      else
        flash[:message] = "Password does not match"
        flash[:errors] = @user.errors.full_messages
        redirect_to login_path
      end
    end
  end

  def destory
    session.delete(:user_id)
    redirect_to login_path
  end


end
