class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_list_categories
  #before_action :set_cart

  def current_user_exist?
    redirect_to home_path if current_user.present?
  end

  #def set_cart
  #  if current_user
  #    if Cart.find_by_user_id(current_user.id).present?
  #      @cart = Cart.find_by_user_id(current_user.id)
  #    else
  #      @cart = Cart.new
  #      @cart.user_id = current_user.id
  #      @cart.save
  #    end
  #  end
  #end

  # uses in sessions/create
  def set_cart
    if current_user && Cart.find_by_user_id(current_user&.id).nil?
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.save
    end
  end

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  # for working navbar with category list everywhere
  def set_list_categories
    @categories = Category.all
  end
end
