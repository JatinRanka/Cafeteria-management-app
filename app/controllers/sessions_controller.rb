class SessionsController < ApplicationController
  def new
    render "index"
  end

  def create
    user = User.find_by(email: params[:email])&.authenticate(params[:password])
    if user
      session[:current_user_id] = user.id
      flash[:error] = "Logged in!"
      redirect_to new_sessions_path
    else
      flash[:error] = "Invalid email/password!"
      redirect_to new_sessions_path
    end
  end

  def destroy
  end
end
