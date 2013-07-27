class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: :profile

	def home
	end

	def profile	
		@user = current_user
		@weights = Weight.where(user_id:@user.id)
	end
end
