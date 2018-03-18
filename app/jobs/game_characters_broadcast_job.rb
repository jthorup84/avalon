class GameCharactersBroadcastJob < ApplicationJob
  queue_as :default

  def perform(object, action)
    send(action, object)
  end

  def joined(character)
    ActionCable.server.broadcast "game-#{character.game_id}:characters", characterHtml: render_character(character), status: "joined"
  end

  def left(character)
    ActionCable.server.broadcast "game-#{character.game_id}:characters", character: character, status: "left"
  end

  private
    def render_character(character)
      ApplicationController.renderer.render partial: 'characters/game/character', locals: { character: character, yourself: nil }
    end
end
