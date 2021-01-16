class CreateVoteRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :vote_relationships do |t|
      t.integer :user_id, null: false
      t.integer :vote_item_id, null: false

      t.timestamps
    end
    add_index :vote_relationships, :user_id
    add_index :vote_relationships, :vote_item_id
    add_index :vote_relationships, [:user_id, :vote_item_id], unique: true
  end
end
