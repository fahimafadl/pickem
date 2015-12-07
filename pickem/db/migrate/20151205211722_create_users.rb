class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.integer :wins
      t.integer :losses
      t.integer :total
      t.float :ratio    

      t.timestamps null: false
    end
  end
end
