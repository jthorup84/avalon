class AddGameModel < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :code
      t.boolean :active
      t.timestamps
    end
    add_column :characters, :game_id, :integer
  end
end
