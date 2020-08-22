class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :contest
end
