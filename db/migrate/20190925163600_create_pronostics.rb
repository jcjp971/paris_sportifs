class CreatePronostics < ActiveRecord::Migration[5.2]
  def change
    create_table :pronostics do |t|
      t.date :date
      t.references :prono_site, foreign_key: true
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
