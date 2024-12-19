class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin

  def dashboard
    
  end

  private

  def ensure_admin
    redirect_to root_path, alert: 'Access denied!' unless current_user.admin?
  end
end
