class CreateChampionships < ActiveRecord::Migration[5.2]
  def change
    create_table :championships do |t|
      t.string :name
      t.string :foot_api_league_key
      t.string :country_code
      t.string :url1
      t.string :url2

      t.timestamps
    end
  end
end
