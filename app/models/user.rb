
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  alias_attribute :email, :password
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, :presence => true
  validates :password, :confirmation  => true


  has_many :projects

  def full_name
    "#{first_name} #{last_name}"
  end
end
