class ApplicationController < ActionController::Base
  helper_method :is_loggedin?, :current_user


  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    # byebug
  end

  def is_loggedin?
    # True or false
    !!current_user
  end

  def authorized
    redirect_to login_path unless session[:user_id]
  end

  def restrict_access
    redirect_to users_path, :alert => "Access denied"
  end
end
