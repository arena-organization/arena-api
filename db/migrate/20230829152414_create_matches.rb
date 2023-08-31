class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.datetime :date_time

      t.timestamps
    end
  end
end
