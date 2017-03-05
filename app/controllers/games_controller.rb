class GamesController < ApplicationController
  def update
    @game = Game.find params[:id]
    @game.update(game_params)
    GameBuilder.new(@game).assign_random_roles
    redirect_to :back
  end

  private
  def game_params
    params.require(:game).permit(:active)
  end
end