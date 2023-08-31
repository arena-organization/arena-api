class CreatePlayerMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :player_matches do |t|
      t.references :player, foreign_key: { to_table: :users }, null: false
      t.references :match, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
