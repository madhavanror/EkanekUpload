class UsersController < ApplicationController
  before_action :logged_in?, only: :log_out

  def login; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_session
      redirect_to documents_path
    else
      render 'new'
    end
  end

  def verify_login
    @user = User.find_by(email: login_params[:email])
    if @user.present? && @user.authenticate(login_params[:password])
      set_session
      redirect_to documents_path
    else
      flash[:error] = 'User Name and Password is incorrect'
      redirect_to root_path
    end
  end

  def log_out
    reset_session
    redirect_to root_path
  end

  private

  def set_session
    session[:logged_in] = true
    session[:email] = @user.email
  end

  def login_params
    params.permit(:email, :password)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
