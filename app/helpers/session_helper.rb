module SessionHelper

  def current_user
    User.find_by_token(session[:token])
  end

  def current_user=(user)
    @current_user = user
    session[:token] = user.token
  end

  def end_session!
    session[:token] = nil
  end

  def require_current_user!
    redirect_to new_session_url unless current_user
  end

  def require_no_current_user!
    redirect_to user_url(current_user) if current_user
  end
end