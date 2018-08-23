class SentRequestsController < ApplicationController
  def new
    user = User.find(session[:user_id])
    @sent_request = SentRequest.new
    @users = User.all - [user] - (user.requested_users) - (user.matched_users)
    if @users.length == 0
      flash[:message] = "You've sent everyone a request."
    end
  end

  def create
    @user = User.find(session[:user_id])
    @sent_request = SentRequest.create(user_id: session[:user_id], requested_user_id: params[:sent_request][:user_id])
    redirect_to user_path(@user)
  end

end
