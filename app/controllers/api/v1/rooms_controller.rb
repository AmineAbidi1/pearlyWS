class Api::V1::RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end

	def get_statuses
		@reservations = Reservation.all
	end

	def book
		puts "#{params[:roomID]} ==+==yeeaa"
		room = Room.find(params['roomID'])
		user = User.find_by_nickname(params[:nickname])
		start_time = params[:startTime]
		end_time = params[:endTime]

		reservation = Reservation.new(room_id: room.id, user_id: user.id, start_time: start_time, end_time: end_time)
		if reservation.save!
			@result = "Booking created!"
		else
			@result = "Something wrong happened!"
		end
	end
end