class AddOwnerToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :owner_id, :integer
  end
end
