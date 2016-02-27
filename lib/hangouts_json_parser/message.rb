module HangoutsJsonParser
	# A message sent in a Conversation
	class Message
		# @return [User] the User that sent this message
		attr_reader :sender
		# @return [Time] timestamp
		attr_reader :timestamp
		# @return [Array<Attachment>] attachments
		attr_reader :attachments

		def initialize sender, timestamp, attachments
			@sender = sender
			@timestamp = timestamp
			@attachments = attachments
		end

		# Creates a message from event data
		def self.from_event_data data
			# TODO: move type to const?
			raise "Event passed is not a message" unless data["event_type"].eql? "REGULAR_CHAT_MESSAGE"

			attachments = (data.dig("chat_message", "message_content", "attachment") || []).map do |data|
				Attachment::Attachment.from_message_attachment data
			end

			# Timestamp is in microseconds, convert to float seconds
			Message.new nil, Time.at(data["timestamp"].to_f / 1.0e06), attachments
		end
	end
end
