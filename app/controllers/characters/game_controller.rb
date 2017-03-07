module Characters
  class GameController < ApplicationController
    before_action :get_character

    def edit
      @game = Game.find @character.game_id
    end

    def update
      @game = Game.find @character.game_id
      @game.update(game_params)
      if @game.errors.blank?
        flash[:notice] = "Game Updated!"
      else
        flash[:notice] = @game.errors.full_messages
      end
      redirect_to :back
    end

    def show
      @game = Game.includes(:characters).find @character.game_id
      redirect_to game_character_path(@game, @character) if @game.active
    end

    private
    def get_character
      @character = ::Character.find params[:character_id]
    end

    def game_params
      params.require(:game).permit(
        :bad_number, special_bad: [], special_good: []
      )
    end
  end
end