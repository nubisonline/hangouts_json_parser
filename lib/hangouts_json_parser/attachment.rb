module HangoutsJsonParser
	# All possible attachments
	module Attachment
		# An attachment to a chat message
		class Attachment
			# Creates an attachment from message data
			# @param data [Hash] attachment data
			# @return [Attachment] new Attachment
			def self.from_message_attachment data
				raise "Data passed is not an attachment" if data.dig("embed_item", "type").nil?

				case data.dig("embed_item", "type")
				when Photo.type
					Photo.from_message_attachment data
				when Location.type
					Location.from_message_attachment data
				else
					nil
				end
			end

			# @return [Array] type identifier of this attachment
			def self.type
				nil
			end
		end
	end
end
