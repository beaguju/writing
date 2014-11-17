class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :text
      t.string :title
      t.references :parent, index: true

      t.timestamps
    end
  end
end
