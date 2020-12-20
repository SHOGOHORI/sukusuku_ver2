class CreateVoteItems < ActiveRecord::Migration[6.0]
  def change
    create_table :vote_items do |t|
      t.string :item
      t.references :vote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
