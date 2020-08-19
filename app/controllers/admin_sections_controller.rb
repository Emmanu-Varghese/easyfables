class AdminSectionsController < ApplicationController
	def dashboard
	end
	def list_users
		@users = User.all
	end
	def destroy_user
		@user = User.find(params[:id])
		@user.destroy

		redirect_to list_users_path, notice: 'User was successfully deleted.'
	end
end
