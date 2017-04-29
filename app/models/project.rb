class Project < ApplicationRecord
  validates :project_details, :project, :presence => true
  validates :start_date, :coding, :presence => true
  #validates :password, :password

  belongs_to :user
end
