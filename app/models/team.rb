class Team < ApplicationRecord
  belongs_to :trainer 
  belongs_to :league 
  has_many :team_memberships

  validates :name, presence: true
end
