module HangoutsJsonParser
	module Attachment
		# A location attachment
		class Location < Attachment
			#TODO: Extract all data from this object
			#This one actually looks like it holds other types of attachments, that might be worth looking in to

			# @return [String] url to the location on Google Maps
			attr_reader :url

			def initialize url
				@url = url
			end

			# Creates a Location from message data
			# @param data [Hash] attachment data
			# @return [Location] new Location
			def self.from_message_attachment data
				raise "Attachment passed is not a location" unless data.dig("embed_item", "type").eql? Location.type

				Location.new data.dig("embed_item", "id")
			end

			# @return [Array] type identifier of this attachment
			def self.type
				["PLACE_V2", "THING_V2", "THING"]
			end
		end
	end
end
