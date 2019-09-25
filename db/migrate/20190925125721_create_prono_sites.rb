class CreatePronoSites < ActiveRecord::Migration[5.2]
  def change
    create_table :prono_sites do |t|
      t.string :name
      t.string :url
      t.string :logo
      t.integer :tx_succes
      t.integer :tx_accuracy
      t.integer :tx_risk

      t.timestamps
    end
  end
end
