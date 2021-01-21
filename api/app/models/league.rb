class League < ApplicationRecord
  has_many :league_memberships
  has_many :trainers, :through => :league_memberships
  has_one :league_setting

  validates :name, uniqueness: true

  def add_league_owner(trainer)
    trainer_membership = LeagueMembership.find_by(league_id: id, trainer_id: trainer.id)
    trainer_membership.update(league_owner: true)
  end

  def league_owner 
    league_owner_membership = LeagueMembership.find_by(league_id: self, league_owner: true)
    league_owner_membership.trainer
  end
end
