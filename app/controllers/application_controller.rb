class ApplicationController < ActionController::Base
  def current_user_exist?
    redirect_to home_path if current_user.present?
  end
end
