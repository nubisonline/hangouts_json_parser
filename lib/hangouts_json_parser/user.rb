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
	end
end
