require "rubypython"

class Room < ActiveRecord::Base
	has_many :reservations
	has_many :room, :through => :reservations

	def sensors
		# RubyPython.start # start the Python interpreter
		# 	import time
		# 	from relayr import Client
		# 	from relayr.dataconnection import MqttStream
		# 	c = Client(token='yINVrGABp5d8VhmvAdvyFyzLMP.aK3PzRevoke Token')
		# 	dev = c.get_device(id='72e3b133-c707-498d-9605-86a752ac405b')
		# 	def mqtt_callback(topic, payload):
		# 	    print('%s %s' % (topic, payload))
		# 	stream = MqttStream(mqtt_callback, [dev])
		# 	stream.start()
		# 	time.sleep(10)
		# 	stream.stop()
		# RubyPython.stop
	end

	def current_reservation
		self.reservations.min_by{ |r| DateTime.now.to_i - r.start_time }
	end

	def next_reservation
		nxt = Reservation.where(room_id: self.id).order(id: :desc).first
	end
end
