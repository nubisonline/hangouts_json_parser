module HangoutsJsonParser
	# A Hangouts chat
	class Conversation
		# @return [String] the chat id
		attr_reader :id
		# @return [Symbol] the chat type, :group or :private
		attr_reader :type
		# @return [Array<User>] the Users that are participating in this chat
		attr_reader :participants
	end
end
