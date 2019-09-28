class AddColumns3ToPronostic < ActiveRecord::Migration[5.2]
  def change
    add_column :pronostics, :cote1, :string
    add_column :pronostics, :cote2, :string
    add_column :pronostics, :cote3, :string
  end
end
