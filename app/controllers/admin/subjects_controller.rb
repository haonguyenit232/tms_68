class Admin::SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  load_and_authorize_resource
  before_action :load_subject, except: [:index, :new, :create]

  def new
    @subject = Subject.new
    @task = @subject.tasks.build
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "admin.subjects.create_success"
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "admin.subjects.update_success"
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description,
      tasks_attributes: [:id, :name, :description, :_destroy]
  end

  def load_subject
    @subject = Subject.find_by id: params[:id]
    unless @subject
      flash[:danger] = t "admin.subjects.subject_not_found"
      redirect_to admin_root_path
    end
  end
end
