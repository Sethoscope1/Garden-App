class NotificationsController < ApplicationController
  before_filter :require_current_user!

  def index
    @notifications = current_user.notifications

    render :index
  end
  
  def destroy
    @notification.note.due_date = nil
    @notification.note.save!
    # @notification = Notification.find(params[:id])
    # @notification.note.due_date = nil
    # @notification.note.save!
    
  end



end
