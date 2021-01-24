class AddImpressionsCountToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :impressions_count, :integer, default: 0
  end
end
