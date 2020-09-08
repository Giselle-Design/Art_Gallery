class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate params[:password]
      session[:user_id] = user.id
      redirect_to home_path, notice: "Sign in!"
    else
      flash[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged Out!'
  end

end
