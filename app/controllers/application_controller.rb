class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_up_path
    '/choose_restaurant'
  end
end
