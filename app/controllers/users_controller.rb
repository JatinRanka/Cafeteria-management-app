class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: [:new, :create]

  def new
    render "index"
  end

  def create
    User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      role: params[:role] || "customer"
    )
  end

end