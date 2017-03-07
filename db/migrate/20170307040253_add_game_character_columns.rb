class AddGameCharacterColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :special_bad, :jsonb
    add_column :games, :special_good, :jsonb, default: ['Merlin']
    add_column :games, :bad_number, :integer, default: 2, null: false
  end
end
