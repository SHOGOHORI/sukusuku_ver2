class CreateConsultationCommentReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :consultation_comment_replies do |t|
      t.text :content
      t.json :image
      t.references :user, null: false, foreign_key: true
      t.references :consultation_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
