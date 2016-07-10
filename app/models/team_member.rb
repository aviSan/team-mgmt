class TeamMember < ActiveRecord::Base
  validates :name, :email, :mobile, :designation, presence: true
end
