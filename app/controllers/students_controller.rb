class StudentsController < ApplicationController
	def index
		@students = Student.paginate(:page => params[:page], :per_page => 3)
	end

	def new
	  @student = Student.new
	end

    def create
  	  current_user.create_student(student_params)
  	  redirect_to new_room_path
    end

    private
    def student_params
      params.require(:student).permit(:name, :skypeid, :grade)
    end
    def room_params
      params.require(:room).permit(:id, :name, :session_id)
    end
end
