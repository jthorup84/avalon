module Characters
  class GameController < ApplicationController
    before_action :get_character

    def show
      @game = Game.includes(:characters).find @character.game_id
      redirect_to game_character_path(@game, @character) if @game.active
    end

    private
    def get_character
      @character = ::Character.find params[:character_id]
    end
  end
end