class CreateEstablishments < ActiveRecord::Migration[6.1]
  def change
    create_table :establishments do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.string :name
      t.text :description
      t.string :foundation_date
      t.string :address
      t.string :phone
      t.time :open_at
      t.time :closed_at

      t.timestamps
    end
  end
end
