class GameCharactersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game-#{params['game']}:characters"
  end

  def kick(payload)
    character = Character.find_by id: payload["characterId"]
    character.destroy if character.present?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
