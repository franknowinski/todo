class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
