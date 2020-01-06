class SessionsController < ApplicationController
  before_action :current_user_exist?, except: :destroy

  def new; end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to home_path, notice: t('controllers.sessions.logged_in')
    else
      redirect_to new_session_path, alert: t('controllers.sessions.failed')
    end
  end

  def destroy
    logout
    redirect_to home_path, notice: t('controllers.sessions.logget_out')
  end
end
