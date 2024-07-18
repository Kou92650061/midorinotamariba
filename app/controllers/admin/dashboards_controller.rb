class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_avtion :authenticate_admin!
  def index
    @users = User.all
  end
end
