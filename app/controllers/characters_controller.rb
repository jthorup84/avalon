class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      @game = Game.build
      @game.characters << @character
      redirect_to character_game_path @character
    else
      render :new
    end
  end

  def destroy
    character = Character.find_by id: params[:id]
    character.destroy if character.present?
    redirect_to :back
  end

  private
  def character_params
    params.require(:character).permit(:name)
  end
end