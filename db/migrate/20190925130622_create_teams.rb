class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :foot_api_team_id
      t.string :logo
      t.string :name2
      t.string :name3

      t.timestamps
    end
  end
end
