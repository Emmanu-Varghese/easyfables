class Rule < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	validates_uniqueness_of :title, :case_sensitive => false
	has_rich_text :content
end
