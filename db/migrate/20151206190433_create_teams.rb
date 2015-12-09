class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_id
      t.string :name
      t.string :logo_url
      t.integer :wins
      t.integer :losses
      t.integer :played
      t.float :off_pass_ypg
      t.float :off_rush_ypg
      t.float :off_tot_ypg
      t.float :def_pass_ypg
      t.float :def_rush_ypg
      t.float :def_tot_ypg

      t.timestamps null: false
    end
  end
end
