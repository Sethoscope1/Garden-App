class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'rubygems'

  include ApplicationHelper
  include SessionHelper

end

