module Characters
  class GameController < ApplicationController
    before_action :get_character

    def show
      @game = Game.includes(:characters).find @character.game_id
    end

    private
    def get_character
      @character = ::Character.find params[:character_id]
    end
  end
end