class CreateLeagueMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :league_memberships do |t|
      t.belongs_to :trainer 
      t.belongs_to :league 
      t.boolean :league_owner, default: false

      t.timestamps
    end
  end
end
