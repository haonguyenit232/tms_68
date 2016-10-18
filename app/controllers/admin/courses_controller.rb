class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  load_and_authorize_resource

  def index
  end
end
