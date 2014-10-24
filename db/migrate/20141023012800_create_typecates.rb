class CreateTypecates < ActiveRecord::Migration
  def change
    create_table :typecates do |t|
      t.string :name

      t.timestamps
    end
  end
end
