class WeightsController < ApplicationController
	
	before_filter :authenticate_user!
	
	def index
		@weights = Weight.all
		@weight = Weight.new
	end

	def new
		respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @weight } 
      		format.js
        end
	end

	def create
		@user = current_user
		@weight = @user.weights.build(weight_params)
		
		#render new_user_session unless @user

		respond_to do |format|
			if @weight.save	
				format.html{ redirect_to weights_path, notice: "Weight added!" }
				format.json{ render json: @weight, status: :created, location: @weight }
				format.js
			else
				format.html{ render action: 'new' }
				format.json { render json: @weight.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	def edit
	end

	private
		def weight_params
			params.require(:weight).permit(:value)
		end

		
end
