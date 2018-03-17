class CharacterBroadcastJob < ApplicationJob
  queue_as :default

  def perform(character, action)
    send(action, character)
  end

  def kicked(character)
    puts "kicked " + "$" * 40
    ActionCable.server.broadcast "character-#{character.id}", character: character, status: "kicked"
  end

end
