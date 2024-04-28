class Admin::ApplicationController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    # if not logged will be redirected to login page
    authenticate_user!
    # if not an admin will be redirected to root page
    redirect_to root_path, alert: 'not authorized' unless current_user.roles.include?('admin')
  end
end
