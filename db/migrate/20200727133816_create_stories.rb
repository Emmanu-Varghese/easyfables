class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :tittle
      t.integer :written_by
      t.text :intro
      t.text :content
      t.belongs_to :contest, foreign_key: true
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
