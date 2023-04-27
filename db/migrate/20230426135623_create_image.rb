class CreateImage < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :copyright
      t.boolean :is_picture_of_the_day, default: false
      t.references :collection, null: true, foreign_key: true
      t.timestamps
    end
  end
end
