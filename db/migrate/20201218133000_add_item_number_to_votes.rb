class AddItemNumberToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :item_nember, :integer
  end
end
