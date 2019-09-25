class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :date
      t.references :team1
      t.references :team2
      t.references :championship, foreign_key: true
      t.string :result
      t.string :foot_api_fixture_id

      t.timestamps
    end
  end
end
