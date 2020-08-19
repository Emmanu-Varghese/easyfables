class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :title
      t.text :content
      t.integer :prize_money
      t.date :start_date
      t.date :end_date
      t.belongs_to :rule, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
