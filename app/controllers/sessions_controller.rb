class SessionsController < ApplicationController
  include SessionsHelper

  def create
    @user = User.find_by(email: session_params[:email])
    p "*" * 100
    p params
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to search_index_path
    else
      redirect_to new_session_path, :notice => "Invalid email or password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Successfully logged out."
  end

  private

  def session_params
    params.require(:sessions).permit(:email,:password)
  end

end
