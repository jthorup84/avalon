class GameCharactersBroadcastJob < ApplicationJob
  queue_as :default

  def perform(action, object)
    send(action, object)
  end

  def joined(character)
    game = Game.find_by id: character.game_id
    return unless game
    game.characters.each do |themself|
      CharacterBroadcastJob.perform_now :joined, themself, character
    end
  end

  def left(character)
    ActionCable.server.broadcast "game-#{character.game_id}:characters", character: character, status: "left"
  end

end
