# app/views/room/index.json.jbuilder

json.rooms @reser do |r|
  json.id r.id
  json.roomID r.room_id
  json.nickname r.user.nickname
  json.start_time r.start_time
  json.end_time r.end_time
end