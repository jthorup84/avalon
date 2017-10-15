class AddSpecialCharacterDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :games, :special_good, []
    change_column_default :games, :special_bad, []
  end
end
