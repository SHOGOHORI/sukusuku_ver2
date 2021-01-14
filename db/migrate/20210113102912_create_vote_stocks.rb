class CreateVoteStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :vote_stocks do |t|
      t.references :vote, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
