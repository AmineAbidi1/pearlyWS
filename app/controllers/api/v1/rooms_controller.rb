class Api::V1::RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end

	def get_statuses
		@reservations = Reservation.all
	end
end