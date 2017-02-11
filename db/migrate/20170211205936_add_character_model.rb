class AddCharacterModel < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :type
      t.string :name
      t.timestamps
    end
  end
end
