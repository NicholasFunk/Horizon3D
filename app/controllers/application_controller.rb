class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.

  before_action :initialize_session
  before_action :set_categories
  helper_method :cart

  def current_user 
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/login' unless logged_in?
  end

  private
  def initialize_session
    session[:cart] ||= []
  end

  def set_categories
    @categories = Category.all
  end

  def cart
    Product.find(session[:cart])
  end
end
