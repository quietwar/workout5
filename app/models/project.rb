class Project < ApplicationRecord
  validates :project_details, :project, :presence => true
  validates :start_date, :coding, :presence => true
  

  belongs_to :user
end
