class League < ApplicationRecord
  has_many :league_memberships
  has_many :trainers, :through => :league_memberships

  validates :name, uniqueness: true
end
