class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :unique_id, limit: 7

      t.index :unique_id, unique: true
      t.index :url, unique: true
      t.timestamps
    end
  end
end
