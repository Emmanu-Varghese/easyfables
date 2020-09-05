class Story < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :contest, optional: true
	has_rich_text :content
	has_many :comments, as: :commentable

	enum status: {"Submitted": 0, "In Review": 1, "Accepted": 2, "Need Correction": 3, "Published": 4 }

	after_create :set_submitted_status

	def set_submitted_status
		self.update(:status => "Submitted")
	end
end
