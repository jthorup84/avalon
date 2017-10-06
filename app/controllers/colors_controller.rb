class ColorsController < ActionController::Base
  def show
    numbers = [0,1]
    render json: {color_of_the_day: [numbers.sample, numbers.sample, numbers.sample]}
  end
end