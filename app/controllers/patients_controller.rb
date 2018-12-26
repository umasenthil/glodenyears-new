class PatientsController < ApplicationController
	def index
		@patients = Patient.paginate(:page => params[:page], :per_page => 3)
	end

	def new
	  @patient = Patient.new
	end

    def create
  	  current_user.create_patient(patient_params)
  	  redirect_to static_pages_home_path
    end

    private
    def patient_params
      params.require(:patient).permit(:name, :skypeid)
    end
end
