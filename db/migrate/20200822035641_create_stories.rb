class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.text :intro
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :contest, null: false, foreign_key: true
      t.integer :status
      t.datetime :accepted_at
      t.integer :like, default: 0
      t.boolean :banned, default: false
      t.text :ban_reason
      t.datetime :banned_at
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
