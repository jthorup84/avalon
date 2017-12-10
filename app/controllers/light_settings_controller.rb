class LightSettingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    render json: light_setting
  end

  def update
    light_setting.update(light_setting_params)
    head 200
  end

  private

  def light_setting
    @light_setting ||= LightSetting.last || LightSetting.create
  end

  def light_setting_params
    params.permit(
      :lights_on,
      :brightness_level,
      :red_value,
      :blue_value,
      :green_value
    )
  end
end