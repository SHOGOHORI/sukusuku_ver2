class AddCategoryIdToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :category_id, :integer, index: { unique: true }, foreign_key: true
  end
end
