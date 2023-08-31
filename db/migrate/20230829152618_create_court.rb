class CreateCourt < ActiveRecord::Migration[6.1]
  def change
    create_table :courts do |t|
      t.references :establishment, null: false, foreign_key: true
      t.string :title
      t.timestamps
    end
  end
end
