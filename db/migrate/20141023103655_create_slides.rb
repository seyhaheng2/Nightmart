class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :name
      t.string :image
      t.string :video
      t.text :description

      t.timestamps
    end
  end
end
