class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to new_sessions_path
    end
  end

  def is_user_owner
    unless current_user[:role]=="owner"
      redirect_to "/"
    end
  end

  def is_user_clerk_or_owner
    unless (current_user[:role] == "owner" or current_user[:role] == "clerk")
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]

    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end

end
