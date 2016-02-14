require 'rest-client'
class Api::V1::RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end

	def get_statuses
		@reservations = Reservation.all
	end

	def book
		room = Room.find(params['roomID'])
		user = User.find_by_nickname(params[:nickname])
		start_time = params[:startTime]
		end_time = params[:endTime]

		#POST /logs/{user_token}/{log_name}/

		#RestClient.post "/logs/e35d9eac/berlin_hack003/", :logs => []

		# Send request to Zeus

		reservation = Reservation.new(room_id: room.id, user_id: user.id, start_time: start_time, end_time: end_time)
		if reservation.save!
			@result = "Booking created!"
			RestClient.post "https://api.tropo.com/1.0/sessions", :phoneNumber => user.phoneNumber, :room_name => room.title, :token => "74477a6170634b74424f5176666d4954535263735a44424d64564f63675878716a61636474746e44644e4d4e"
		else
			@result = "Something wrong happened!"
		end
	end

	def reservations
		room = Room.find(params[:id])
		@reser = room.reservations	
		@reser
	end
end