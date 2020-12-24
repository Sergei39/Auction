class ApplicationController < ActionController::Base
  include SessionHelper

  before_action :require_login

  private

  def require_login
    unless signed_in?
      flash[:danger] = 'Need login'
      redirect_to login_path
    end
  end
end
