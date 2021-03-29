class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: [:new, :create]
  before_action :is_user_owner, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
    render "new"
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
