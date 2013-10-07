class SessionsController < ApplicationController
  #before_filters

  def create
    user = User.find_by_credentials(
      params[:user][:name],
      params[:user][:password]
    )

    if user.nil?
      # flash[:errors] = user.errors.full_messages
      flash[:errors] = "Make sure you enter a correct Name and Password"
      render :new
    else
      self.current_user = user
      redirect_to user_url(user)
    end
  end

  def destroy
    end_session!
    redirect_to new_session_url
  end

  def new
    render :new
  end


end
