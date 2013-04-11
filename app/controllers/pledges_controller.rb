class PledgesController < ApplicationController

before_filter :require_login
before_filter :require_project

	def new
		@pledge = @project.pledges.build
	end

	def create
		@pledge = @project.pledges.build params[:pledge]
		@pledge.user = current_user

		if @pledge.save
			redirect_to @project, notice: "Thank-you for making a pledge for my project."
		else
			render.new
		end
	end

	protected

	def require_project
		@project = Project.find params[:project_id]
	end

end



