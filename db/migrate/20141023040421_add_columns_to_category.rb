class AddColumnsToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :typecate, index: true
  end
end
