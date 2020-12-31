class RemoveVoteRelationshipFromVoteId < ActiveRecord::Migration[6.0]
  def change
    remove_column :vote_relationships, :vote_id, :integer
  end
end
