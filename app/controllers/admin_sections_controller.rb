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

	def list_stories
		if params[:status] == "All" or params[:status].nil?
			@stories = Story.order('created_at DESC').paginate(page: params[:page], per_page: 10)
		elsif  params[:status] == "Submitted"
			@stories = Story.where(:status => "Submitted").order('created_at DESC').paginate(page: params[:page], per_page: 10)
		elsif  params[:status] == "In Review"
			@stories = Story.where(:status => "In Review").order('created_at DESC').paginate(page: params[:page], per_page: 10)
		elsif  params[:status] == "Need Correction"
			@stories = Story.where(:status => "Need Correction").order('created_at DESC').paginate(page: params[:page], per_page: 10)
		elsif  params[:status] == "Published"
			@stories = Story.where(:status => "Published").order('created_at DESC').paginate(page: params[:page], per_page: 10)
		end		
	end
end
