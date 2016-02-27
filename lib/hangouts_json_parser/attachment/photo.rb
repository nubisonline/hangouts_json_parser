module HangoutsJsonParser
	module Attachment
		# A photo attachment
		class Photo < Attachment
			# @return [String] photo ID
			attr_reader :id
			# @return [String] album ID that the photo is in
			attr_reader :album
			# @return [String] link to the photo on Google+
			attr_reader :photo_link
			# @return [String] URL to thumbnail of the image
			attr_reader :thumbnail
			# @return [String] URL of the image
			attr_reader :url

			def initialize id, album, photo_link, thumbnail, url
				@album = album
				@id = id
				@photo_link = photo_link
				@thumbnail = thumbnail
				@url = url
			end

			# Creates a Photo from message data
			# @param data [Hash] attachment data
			# @return [Photo] new Photo
			def self.from_message_attachment data
				raise "Attachment passed is not a photo" unless data.dig("embed_item", "type").eql? Photo.type

				photo = data.dig("embed_item", "embeds.PlusPhoto.plus_photo")
				raise "Photo data not found" if photo.nil?

				Photo.new photo["photo_id"],
							photo["album_id"],
							photo.dig("thumbnail", "url"),
							photo.dig("thumbnail", "image_url"),
							photo["url"]
			end

			# @return [Array] type identifier of this attachment
			def self.type
				["PLUS_PHOTO"]
			end
		end
	end
end
