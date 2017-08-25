class ColorsController < ActionController::Base
  def show
    numbers = Array(0..255)
    render json: {color_of_the_day: [numbers.sample, numbers.sample, numbers.sample]}
  end
end