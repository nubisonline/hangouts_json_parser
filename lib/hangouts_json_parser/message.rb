module HangoutsJsonParser
	# A message sent in a Conversation
	class Message
		# @return [User] the User that sent this message
		attr_reader :sender
		# @return [Time] timestamp
		attr_reader :timestamp

		def initialize sender, timestamp
			@sender = sender
			@timestamp = timestamp
		end

		# Creates a message from event data
		def self.from_event_data data
			# TODO: move type to const?
			raise "Event passed is not a message" unless data["event_type"].eql? "REGULAR_CHAT_MESSAGE"

			# Timestamp is in microseconds, convert to float seconds
			Message.new nil, Time.at(data["timestamp"].to_f / 1.0e06)
		end
	end
end
