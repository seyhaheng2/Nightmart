class AddColumnsToTypecate < ActiveRecord::Migration
  def change
    add_column :typecates, :icon, :string
  end
end
