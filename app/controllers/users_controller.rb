class UsersController < ApplicationController

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
