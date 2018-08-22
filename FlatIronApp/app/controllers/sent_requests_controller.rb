class SentRequestsController < ApplicationController
  def new
    @sent_request = SentRequest.new
  end

  def create
    @user = User.find(session[:user_id])
    @sent_request = SentRequest.create(user_id: session[:user_id], requested_user_id: params[:sent_request][:user_id] )
    redirect_to user_path(@user)
  end

end
