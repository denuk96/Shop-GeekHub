module CheckAuthorization
  include ActiveSupport::Concern

  def current_user_already_exist?
    redirect_to home_path if current_user.present?
  end

  def user_logged_in?
    redirect_to login_path, alert: t('login_first') if current_user.nil?
  end
end
