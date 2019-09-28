class AddColumns2ToPronostic < ActiveRecord::Migration[5.2]
  def change
    add_column :pronostics, :prediction2, :string
    add_column :pronostics, :advice2, :string
    add_column :pronostics, :prediction3, :string
    add_column :pronostics, :advice3, :string
  end
end
