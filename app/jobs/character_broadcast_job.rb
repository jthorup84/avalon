class CharacterBroadcastJob < ApplicationJob
  queue_as :default

  def perform(character, action)
    send(action, character)
  end

  def kicked(character)
    ActionCable.server.broadcast "character-#{character.id}", character: character, status: "kicked"
  end

end
