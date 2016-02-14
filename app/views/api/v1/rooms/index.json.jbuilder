# app/views/room/index.json.jbuilder

json.rooms @rooms do |room|
  json.id room.id
  json.title room.title
  json.description room.description
  json.image room.image
  json.capacity room.capacity
end