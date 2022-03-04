class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :sprite
      t.string :types, array: true
      t.string :abilities, array: true
      

      t.timestamps
    end
  end
end
