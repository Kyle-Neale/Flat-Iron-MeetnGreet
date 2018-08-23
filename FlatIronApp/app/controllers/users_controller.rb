class UsersController < ApplicationController
  before_action :authorized, except: [:index, :new]

  # def validate_url_hack
  #   # Check the params hash to see if the passed :id matches the current user's id
  #   unless params[:id] == user.id
  #     # This line redirects the user to the previous action
  #     redirect_to user_path()
  #   end
  # end

  def profile
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
  #signup
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path(@user)
    end
  end

  def show
    @sent_requests = SentRequest.all
    @user = User.find(params[:id])
    restrict_access if @user.id != session[:user_id]
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit!
  end
end
