class CreateTeamMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :team_memberships do |t|
      t.integer :team_id, null: false
      t.integer :pokemon_id, null: false
      t.integer :kills, default: 0
      t.integer :deaths, default: 0
      t.string :tier, null: false

      t.timestamps
    end
  end
end
