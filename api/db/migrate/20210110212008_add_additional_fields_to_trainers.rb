class AddAdditionalFieldsToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :first_name, :string
    add_column :trainers, :last_name, :string
    add_column :trainers, :total_wins, :integer
    add_column :trainers, :total_losses, :integer
    add_column :trainers, :is_league_owner, :boolean, default: false
  end
end
