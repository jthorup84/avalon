class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    check_for_game
    render :new and return if cant_join?
    if @character.save
      game.characters << @character
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
  def check_for_game
    @game = Game.where(game_params).first
  end

  def cant_join?
    if @game.blank? && game_params[:code].present?
      flash[:notice] = "Game with code #{game_params[:code]} does not exist."
      true
    elsif @game.present? && @game.active
      flash[:notice] = "Game with code #{game_params[:code]} started without you."
      true
    elsif @game.present? && @game.characters.count == 10
      flash[:notice] = "Game with code #{game_params[:code]} is full."
      true
    else
      false
    end
  end

  def game
    @game ||= Game.build
  end

  def character_params
    params.require(:character).permit(:name)
  end

  def game_params
    params.require(:game).permit(:code)
  end
end