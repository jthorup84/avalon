class ColorsController < ActionController::Base
  def show
    colors = ["red", "yellow", "blue", "green", "purple", "brown", "white"]
    render json: {color_of_the_day: colors.sample}
  end
end