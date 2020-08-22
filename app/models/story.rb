class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :contest
  has_rich_text :content
end
