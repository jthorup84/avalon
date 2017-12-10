class CreateLightSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :light_settings do |t|
      t.boolean :lights_on, default: false
      t.integer :brightness_level, default: 100
      t.integer :red_value, default: 100
      t.integer :blue_value, default: 100
      t.integer :green_value, default: 100
    end
  end
end
