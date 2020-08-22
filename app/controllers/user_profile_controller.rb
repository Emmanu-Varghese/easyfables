class UserProfileController < ApplicationController
	def user_profile
		if !params[:tab].nil? or params[:tab] == "my-stories"
		end
		if params[:tab] == "favorites"
		end
	end

	def write_story
	end

	def create_story
	end

	def update_story
	end
end
