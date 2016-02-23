module HangoutsJsonParser
	# A chat user
	class User
		# @return [String] Google id of the user
		attr_reader :id
		# @return [String] in-chat name of the user
		attr_reader :name

		# @return [String] the Google+ profile of the user
		def profile
			"https://plus.google.com/#{id}"
		end

		def initialize id, name
			@id = id
			@name = name
		end

		# Creates a user from participant data
		def self.from_participant_data data
			# TODO: Use the Google+ API to actually look up this person?
			User.new data['id']['gaia_id'], data['fallback_name']
		end
	end
end
