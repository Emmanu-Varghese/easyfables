class UserProfileController < ApplicationController
	def user_profile
		if params[:tab].nil? or params[:tab] == "my-stories"
			@stories = current_user.stories.order('created_at DESC').paginate(page: params[:page], per_page: 6)
		end
		if params[:tab] == "favourites"
			@stories = current_user.favourite_stories.order('created_at DESC').paginate(page: params[:page], per_page: 6)
		end
	end

	def write_story
	end

	def create_story
	end

	def update_story
	end
end
