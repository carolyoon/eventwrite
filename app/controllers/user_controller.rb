class UserController < ApplicationController
  include SessionsHelper

  before_action :authorize, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path 
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def authorize
      redirect_to root_path unless logged_in?
    end

end
