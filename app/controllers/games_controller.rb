class GamesController < ApplicationController
  def update
    binding.pry
    @game = Game.find params[:id]
    @game.update(game_params)
    redirect_to :back
  end

  private
  def game_params
    params.require(:game).permit(:active)
  end
end