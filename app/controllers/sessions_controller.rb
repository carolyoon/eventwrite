class SessionsController < ApplicationController
  include SessionsHelper

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path, :notice => "Invalid email or password."
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.permit(:email, :password)
  end

end
