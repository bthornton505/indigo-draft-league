class LeagueSerializer
  include JSONAPI::Serializer
  attributes :id, :name
  # has_many :league_memberships
  has_many :trainers
  has_one :league_setting
end
