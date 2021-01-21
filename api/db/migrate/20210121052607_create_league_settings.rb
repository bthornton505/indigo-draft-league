class CreateLeagueSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :league_settings do |t|
      t.belongs_to :league
      t.string :format
      t.integer :number_of_matchups_a_week
      t.integer :number_of_teams
      t.integer :number_of_playoff_teams
      t.boolean :ev_training_allowed
      t.boolean :iv_training_allowed
      t.boolean :duplicate_pokemon_allowed
      t.boolean :evolution_line_allowed
      t.boolean :repeat_items_allowed
      t.integer :weeks_in_a_season
      t.boolean :trading_allowed
      t.integer :flex_position_budget

      t.timestamps
    end
  end
end
