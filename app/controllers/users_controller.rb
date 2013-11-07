class UsersController < ApplicationController
  before_filter :require_current_user!, only: [:index, :destroy, :show]
  before_filter :require_no_current_user!, only: [:create, :new]

  def create
    @user = User.new(params[:user])
    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
  end

  def index
    # search for users in area?
    # search for by email?
  end
end
