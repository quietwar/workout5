class Project < ApplicationRecord
  validates :app_name, :project_details, :project, :presence => true
  validates :start_date, :coding, :presence => true


  belongs_to :user
end
