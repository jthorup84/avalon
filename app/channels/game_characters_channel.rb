class GameCharactersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game-#{params['game']}:characters"
  end

  def kick(payload)
    puts payload
    character = Character.find_by id: payload["characterId"]
    puts "bye bye?"
    puts character
    puts character.present?
    character.destroy if character.present?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
