class Contest < ApplicationRecord
  belongs_to :rule
  belongs_to :category
end
