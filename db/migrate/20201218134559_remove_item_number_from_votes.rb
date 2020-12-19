class RemoveItemNumberFromVotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :item_nember, :integer
  end
end
