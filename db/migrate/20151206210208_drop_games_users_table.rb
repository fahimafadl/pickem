class DropGamesUsersTable < ActiveRecord::Migration
  def up
    drop_table :games_users
  end

  def down
    create_table :picks do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :pick
      t.integer :result

      t.timestamps null: false
    end
  end
end
