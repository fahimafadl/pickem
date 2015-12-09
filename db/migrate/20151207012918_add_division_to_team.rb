class AddDivisionToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :division, :string
  end
end
