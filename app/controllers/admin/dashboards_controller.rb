class Admin::DashboardsController < ApplicationController
  before_avtion :authenticate_admin!
  def index
    @users = User.all
  end
end
