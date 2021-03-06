module Games
  class CharactersController < ApplicationController
    before_action :get_game

    def show
      @character = Character.find params[:id]
      redirect_to character_game_path(@character) unless @game.active
      characters = @game.characters - [@character]
      @knowledge = @character.knowledge(characters)
    end

    private
    def get_game
      @game = Game.includes(:characters).find params[:game_id]
    end
  end
end