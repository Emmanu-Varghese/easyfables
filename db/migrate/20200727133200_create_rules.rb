class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :title
      t.text :content
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
