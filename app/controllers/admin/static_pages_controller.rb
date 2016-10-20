class Admin::StaticPagesController < ApplicationController
  layout "admin_application"
  before_action :authenticate_user!
  before_action :verify_admin

  def index
  end
end
