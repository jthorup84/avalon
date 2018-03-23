class CharacterBroadcastJob < ApplicationJob
  queue_as :default

  def perform(action, *args)
    send(action, *args)
  end

  def kicked(character)
    ActionCable.server.broadcast "character-#{character.id}", character: character, status: "kicked"
  end

  def joined(yourself, character)
    game = Game.find_by id: character.game_id
    args = { yourself: yourself, character: character, game: game }
    ActionCable.server.broadcast "character-#{yourself.id}", characterHtml: render_character(args), status: "joined"
  end

  private
    def render_character(args)
      ApplicationController.renderer.render partial: 'characters/game/character', locals: args
    end

end
