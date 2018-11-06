class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def new
	  @student = Student.new
	end

    def create
      binding.pry
  	  current_user.create_student(student_params)
  	  redirect_to static_pages_home_path
    end

    private
    def student_params
      params.require(:student).permit(:name, :skypeid, :grade)
    end
end
