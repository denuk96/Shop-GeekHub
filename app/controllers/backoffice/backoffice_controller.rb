class Backoffice::BackofficeController < ActionController::Base
  before_action :admin_verify
  layout 'backoffice.html.erb'

  private

  def admin_verify
    redirect_to home_path, alert: 'You have no rights' unless current_user&.admin?
  end
end
