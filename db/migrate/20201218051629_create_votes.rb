class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.string :title
      t.text :content
      t.json :image
      t.integer :child_age
      t.integer :child_moon_age
      t.boolean :pregnant
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :votes, [:user_id, :created_at]
  end
end
