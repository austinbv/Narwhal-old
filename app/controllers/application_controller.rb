require 'pusher'

Pusher.app_id = '6442'
Pusher.key = 'b106769bbea5c2e08e77'
Pusher.secret = '2e88df3b269a7944292a'

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
