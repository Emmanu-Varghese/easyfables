class Story < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :contest, optional: true
	has_rich_text :content
	has_many :comments, as: :commentable

	enum status: {"Submitted": 0, "In Review": 1, "Accepted": 2, "Need Correction": 3, "Published": 4 }

	after_create :set_submitted_status
	after_update :broadcast_like

	def set_submitted_status
		self.update(:status => "Submitted")
	end

	def broadcast_like
		# StoryChannel.broadcast_to("story_channel",["story_like_updation", self.id, self.like ])
		ActionCable.server.broadcast('story_channel', message: [self.id, self.like])
	end
end

