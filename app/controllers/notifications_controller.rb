class NotificationsController < ApplicationController
  before_filter :require_current_user!

  def index
    @notifications = current_user.notifications

    render :index
  end



end
