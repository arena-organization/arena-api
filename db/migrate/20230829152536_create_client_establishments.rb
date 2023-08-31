class CreateClientEstablishments < ActiveRecord::Migration[6.1]
  def change
    create_table :client_establishments do |t|
      t.references :client, foreign_key: { to_table: :users }, null: false
      t.references :establishment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
