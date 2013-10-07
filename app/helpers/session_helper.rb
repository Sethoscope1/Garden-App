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
end