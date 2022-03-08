class TeamMembershipSerializer
  include JSONAPI::Serializer
  attributes :trainer_id, :pokemon_id, :kills, :deaths, :tier

  belongs_to :team
  belongs_to :pokemon
end
