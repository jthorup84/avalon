class GameBroadcastJob < ApplicationJob
  queue_as :default

  def perform(object, action)
    send(action, object)
  end

  def updated(game)
    ActionCable.server.broadcast "game-#{game.id}",
      game: game,
      status: "updated",
      dynamic: {
        good_chars: render_good_chars(game),
        bad_chars: render_bad_chars(game),
        start: render_start(game)
      }
  end

  private
    def render_start(game)
      ApplicationController.renderer.render partial: 'characters/game/start', locals: { game: game }
    end
    def render_bad_chars(game)
      ApplicationController.renderer.render partial: 'characters/game/bad_chars', locals: { game: game }
    end
    def render_good_chars(game)
      ApplicationController.renderer.render partial: 'characters/game/good_chars', locals: { game: game }
    end

end
