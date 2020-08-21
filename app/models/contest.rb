class Contest < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	validates_uniqueness_of :title, :case_sensitive => false
	belongs_to :rule
	belongs_to :category
	has_rich_text :content
end
