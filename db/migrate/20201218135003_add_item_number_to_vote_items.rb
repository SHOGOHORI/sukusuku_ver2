class AddItemNumberToVoteItems < ActiveRecord::Migration[6.0]
  def change
    add_column :vote_items, :item_number, :integer
  end
end
