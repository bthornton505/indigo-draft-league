class LeagueSettingSerializer
  include JSONAPI::Serializer
  attributes :format,
    :number_of_matchups_a_week,
    :number_of_teams,
    :number_of_playoff_teams,
    :ev_training_allowed,
    :iv_training_allowed,
    :duplicate_pokemon_allowed,
    :evolution_line_allowed,
    :repeat_items_allowed,
    :weeks_in_a_season,
    :trading_allowed,
    :flex_position_budget
    
  belongs_to :league
end
