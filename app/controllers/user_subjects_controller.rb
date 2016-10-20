class UserSubjectsController < ApplicationController
  load_and_authorize_resource

  def show
    @tasks = @user_subject.subject.tasks
  end
end
