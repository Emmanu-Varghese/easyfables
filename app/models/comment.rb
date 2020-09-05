class Comment < ApplicationRecord
	validates :body, presence: true
	belongs_to :user, optional: true
	belongs_to :commentable, polymorphic: true

	def comments
		Comment.where(commentable: commentable, parent_id: id)
	end

end
