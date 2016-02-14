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

		#create room
		#resp = JSON.parse(RestClient.post "https://api.ciscospark.com/v1/rooms", :title => "#{user.nickname} + Bookings + #{DateTime.now}", :content_type => :json, :accept => :json, :Authorization => "Bearer NzM0NGFlZmItOTc4Ni00ZDIzLWEzNWQtMjU3NTNjZDA0OWZlMjllMmYxM2EtOWU2")	
		params1 = {:title => "#{user.nickname} Bookings #{DateTime.now}"}
		headers = {:Authorization => "Bearer NzM0NGFlZmItOTc4Ni00ZDIzLWEzNWQtMjU3NTNjZDA0OWZlMjllMmYxM2EtOWU2"}
		resp = JSON.parse(RestClient.post "https://api.ciscospark.com/v1/rooms", params1, headers)
		roomId = resp["id"]

		params2 = {:roomId => roomId, :text => "Hey #{user.nickname}, your booking in room #{room.title} is confirmed, get there in 10 minutes or you will lose it!"}


		RestClient.post "https://api.ciscospark.com/v1/messages", params2, headers
#   "roomId" : "24aaa2aa-3dcc-11e5-a152-fe34819cdc9a",
#   "text" : "PROJECT UPDATE - A new project project plan has been published on Box",
#   "files" : [ "http://www.example.com/images/media.png" ],
#   "toPersonId" : "Y2lzY29zcGFyazovL3VzL1BFT1BMRS9mMDZkNzFhNS0wODMzLTRmYTUtYTcyYS1jYzg5YjI1ZWVlMmX",
#   "toPersonEmail" : "julie@example.com"
# }
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