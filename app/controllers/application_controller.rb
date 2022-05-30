class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    @current_user = User.find_by(email: session[:email])
    session[:logged_in]
  end

  attr_reader :current_user
end
