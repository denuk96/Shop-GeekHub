class Backoffice::BackofficeController < ActionController::Base
  before_action :admin_verify
  layout 'backoffice.html.erb'

  private

  def admin_verify
    redirect_to home_path, alert: t('controllers.admin_verify') unless current_user&.admin?
  end
end
