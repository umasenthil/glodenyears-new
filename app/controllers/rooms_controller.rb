class RoomsController < ApplicationController
	require "opentok"
	def index
		@rooms = Room.order("created_at DESC")
		@new_room = Room.new()
	end

	def create
		@api_key = ENV['API_KEY']
    	opentok = OpenTok::OpenTok.new(ENV["API_KEY"], ENV["API_SECRET"])
    	session = opentok.create_session

    	binding.pry
    	params[:room][:session_id] = session.session_id
    	respond_to do |format|
          if current_user.create_room(room_params)
      	    format.html { redirect_to '/rooms/#{@new_room.id}'}
          #redirect_to rooms_party_path
          else
            format.html { render :controller => 'rooms', :action => "index" }
          end
        end
	end

	def show
	    @api_key = ENV['API_KEY']
		opentok = OpenTok::OpenTok.new(ENV["API_KEY"], ENV["API_SECRET"])
		binding.pry
		@room = Room.find(params[:id])
		@token = opentok.generate_token(@room.session_id)
	end

    private
    def room_params
      @room_params = params.require(:room).permit(:id, :name, :session_id)
    end
end
