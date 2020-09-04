class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :parent_id
      t.references :commentable, polymorphic: true
      t.text :body

      t.timestamps
    end
  end
end
