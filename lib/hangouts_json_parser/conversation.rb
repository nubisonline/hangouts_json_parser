module HangoutsJsonParser
	# A Hangouts chat
	class Conversation
		# @return [String] the chat id
		attr_reader :id
		# @return [Symbol] the chat type, :group or :private
		attr_reader :type
		# @return [Array<User>] the Users that are participating in this chat
		attr_reader :participants

		def initialize id, type, participants
			@id = id
			@type = type
			@participants = participants
		end

		# Creates a Conversation based on a conversation_state object
		# @param state [Hash] conversation_state
		# @return [Conversation] resulting Conversation
		def self.from_state state
			Conversation.new state['conversation']['id']['id'], type_from_string(state['conversation']['type']), state['conversation']['participant_data'].map(&User.method(:from_participant_data))
		end

		private
		def self.type_from_string str
			case str
			when "STICKY_ONE_TO_ONE"
				:private
			when "GROUP"
				:group
			else
				:unknown
			end
		end
	end
end
