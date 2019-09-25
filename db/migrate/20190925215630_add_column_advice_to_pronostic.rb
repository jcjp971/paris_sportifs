class AddColumnAdviceToPronostic < ActiveRecord::Migration[5.2]
  def change
    add_column :pronostics, :advice, :string
  end
end
