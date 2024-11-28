class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.

  before_action :initialize_session
  before_action :set_categories
  before_action :set_current_user
  helper_method :cart

  def set_current_user 
    @user = User.find_by(id: session[:user_id])
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
