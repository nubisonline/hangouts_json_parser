require "hangouts_json_parser/version"
require "hangouts_json_parser/user"
require "hangouts_json_parser/conversation"

# Parse JSON formatted Hangouts data into more useful data structures
module HangoutsJsonParser
	# Parses conversation state into an array of Conversations
	#
	# @param state [Array<Hash>] converstation_state from the Takeout data
	# @return [Array<Conversation>] all conversations in the state
	def self.parse_conversation_state state
		state.map do |s|
			Conversation.from_state s['conversation_state']
		end
	end
end
