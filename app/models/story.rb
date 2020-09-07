class Story < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :contest, optional: true
	has_rich_text :content
	has_many :comments, as: :commentable

	enum status: {"Submitted": 0, "In Review": 1, "Accepted": 2, "Rejected": 3, "Published": 4 }

	after_create :set_submitted_status
	after_update :broadcast_like
	after_update :update_status_fields

	def set_submitted_status
		self.update(:status => "Submitted",:submitted_at => Time.now)
	end

	def broadcast_like
		# StoryChannel.broadcast_to("story_channel",["story_like_updation", self.id, self.like ])
		ActionCable.server.broadcast('story_channel', message: [self.id, self.like])
	end

	def status_badge
		if self.status == "Submitted"
			return '<span class="badge badge-primary">Submitted</span>'.html_safe
		elsif self.status == "In Review"
			return '<span class="badge badge-info">In Review</span>'.html_safe
		elsif self.status == "Accepted"
			return '<span class="badge badge-secondary">Accepted</span>'.html_safe
		elsif self.status == "Rejected"
			return '<span class="badge badge-danger">Rejected</span>'.html_safe
		elsif self.status == "Published"
			return '<span class="badge badge-dark">Published</span>'.html_safe
		end
	end

	def next_status
		if self.status == "Submitted"
			return "In Review"
		elsif self.status == "In Review"
			return "Accepted"
		elsif self.status == "Accepted"
			return "Published"
		elsif self.status == "Published"
			return "Published"
		end
	end

	def update_status_fields
		if self.status_was != self.status
			if self.status == "Submitted"
				self.update(:submitted_at => Time.now)
			elsif self.status == "In Review"
				self.update(:in_review_at => Time.now)
			elsif self.status == "Accepted"
				self.update(:accepted_at => Time.now)
			elsif self.status == "Rejected"
				self.update(:rejected_at => Time.now)
			elsif self.status == "Published"
				self.update(:published_at => Time.now)
			end
		end
	end
end

