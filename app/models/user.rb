class User < ActiveRecord::Base
	has_many :reservations
	has_many :room, :through => :reservations
end
