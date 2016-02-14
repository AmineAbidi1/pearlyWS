# app/views/room/get_statuses.json.jbuilder


json.statuses @reservations do |reservation|
  json.roomID reservation.room.id
  json.title reservation.room.title
  json.description reservation.room.description
  json.image reservation.room.image
  json.capacity reservation.room.capacity
  json.capacity 10
  json.noiseLevel "1000"
	json.proximity "5"
	json.luminocity "100"
	json.humidity "50"
	json.temperature "30"
	json.currentReservation do
		json.nickname reservation.user.nickname
		json.phoneNumber reservation.user.phoneNumber
		json.sparkID reservation.user.sparkID
		json.startTime reservation.room.current_reservation.start_time
		json.endTime reservation.room.current_reservation.end_time
	end
	json.nextReservation do
		json.nickname reservation.user.nickname
		json.phoneNumber reservation.user.phoneNumber
		json.sparkID reservation.user.sparkID
		json.startTime reservation.room.next_reservation.start_time
		json.endTime reservation.room.next_reservation.end_time
	end
end