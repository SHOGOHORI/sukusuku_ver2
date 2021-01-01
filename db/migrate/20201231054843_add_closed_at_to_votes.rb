class AddClosedAtToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :closed_at, :date
  end
end
