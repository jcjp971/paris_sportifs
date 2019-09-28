class AddColumnsToPronostic < ActiveRecord::Migration[5.2]
  def change
    add_column :pronostics, :double_chance, :boolean
    add_column :pronostics, :prediction, :string
  end
end
