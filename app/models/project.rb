class Project < ApplicationRecord
  belongs_to :user

  validates :project_details, :project, :presence => true
  validates :start_date, :coding, :presence => true

end
