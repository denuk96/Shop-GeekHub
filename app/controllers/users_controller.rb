class UsersController < ApplicationController
  include CheckAuthorization
  before_action :current_user_already_exist?

  def index
    redirect_to signup_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation
      if @user.save
        redirect_to login_path, notice: t('controllers.users.create')
      else
        render :new
      end
    else
      redirect_to signup_path, alert: t('controllers.users.paswords_not_matches')
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
