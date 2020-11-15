class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :child_number
      t.string :nick_name
      t.date :brithday

      t.timestamps
    end
    add_index :children, [:user_id, :created_at]
  end
end
