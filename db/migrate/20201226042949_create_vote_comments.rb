class CreateVoteComments < ActiveRecord::Migration[6.0]
  def change
    create_table :vote_comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :vote, null: false, foreign_key: true

      t.timestamps
    end
    add_index :vote_comments, [:user_id, :created_at]
    add_index :vote_comments, [:vote_id, :created_at]
  end
end
