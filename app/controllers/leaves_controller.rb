class LeavesController < ApplicationController
	def index
		# @filterrific = initialize_filterrific(
  #     Leave.find_by_user(current_user),
     
  #     params[:filterrific]
  #   ) or return
	#@leaves = Leave.all
   @leaves = Leave.where(:user_id => current_user)
	end

	def new
		@leave = Leave.new
		@leave.generate_leave_number(current_user)
	end

	def create
		@leave = Leave.new(leave_params)
		@leave.user = current_user
		if @leave.save
      redirect_to @leave
    else
      render 'new'
    end
	end

	def show
		@leave = Leave.find(params[:id])
	end
	def edit
		@leave = Leave.find(params[:id])
	end

	def destroy
		@leave = Leave.find(params[:id])
		@leave.destroy
		redirect_to leaves_url
	end

	private
	def leave_params
		params.require(:leave).permit(:count, :leave_from, :leave_to, :task)
	end
end
