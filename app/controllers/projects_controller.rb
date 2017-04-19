class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = curent_user.projects.new
  end
end
