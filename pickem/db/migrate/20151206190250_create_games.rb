class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :ht_id
      t.integer :hscore
      t.string :at_id
      t.integer :ascore
      t.integer :week
      t.datetime :time

      t.timestamps null: false
    end
  end
end
