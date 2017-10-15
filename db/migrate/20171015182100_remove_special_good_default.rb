class RemoveSpecialGoodDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :games, :special_good, nil
  end
end
