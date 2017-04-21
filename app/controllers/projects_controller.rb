class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def show
    @project = current_user.projects.new(project_params)
  end

  def new
    @project = curent_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:project] = "Project has been created"
      redirect_to [current.user, @project]
    else
      flash.now[:alert] = "Project has not been created"
      render :new
    end
  end

  private

  def project_params(:project).permit(:coding, :project, :project_details, :user_id,)
end
