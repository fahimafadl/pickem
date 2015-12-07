class CreateUserRecords < ActiveRecord::Migration
  def change
    create_table :user_records do |t|
      t.integer :user_id
      t.integer :wins
      t.integer :losses
      t.integer :total
      t.float :ratio

      t.timestamps null: false
    end
  end
end
