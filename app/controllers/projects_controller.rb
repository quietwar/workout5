class ProjectsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
    @friends = current_user.friends
  end

  def show
  end

  def new
    @project = curent_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:notice] = "Project has been created"
      redirect_to [current_user, @project]
    else
      flash.now[:alert] = "Project has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project has been updated"
      redirect_to [current_user, @project]
    else
      flash.now[:alert] = "Project has not been updated"
      render :edit
  end

  def destroy
    @project.destroy
      flash[:notice] = "Project has been deleted"
      redirect_to user_projects_path(current_user)
  end

  private

  def set_project
    @project = current_user.projects.find params[:id]
  end

  def project_params(:project).permit(:app_name, :coding, :project, :project_details, :user_id,)
end
