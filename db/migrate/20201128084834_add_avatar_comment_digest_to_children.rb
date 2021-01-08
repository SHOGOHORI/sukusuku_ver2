class AddAvatarCommentDigestToChildren < ActiveRecord::Migration[6.0]
  def change
    add_column :children, :avatar, :string
    add_column :children, :comment, :string
  end
end
