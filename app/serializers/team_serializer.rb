class TeamSerializer
  include JSONAPI::Serializer
  attributes :trainer_id, :league_id, :name, :wins, :losses

  has_many :team_memberships
end
