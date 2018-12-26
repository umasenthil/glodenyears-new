class UsersController < ApplicationController
	def new
	  @user = User.new
	end

    def create
	  @user = User.new(params.require(:user).permit!)
	  if @user.save
	    session[:user_id] = @user.id
		Rails.logger.debug("My object: #{@user.inspect}")
		if @user.isstudent
			puts "Redirecting to student form"
			redirect_to new_student_path
		else
			puts "Redirecting to care form"
			redirect_to new_patient_path
		end
	    #redirect_to users_path, :notice => "Signed up!"
	  else
	    render "new"
	  end
	end


	def show
		@users = User.all
	end
	
	private

	def user_params
      params.require(:user).permit(:id, :username, :email, :password, :password_confirmation, :isstudent)
    end


end
