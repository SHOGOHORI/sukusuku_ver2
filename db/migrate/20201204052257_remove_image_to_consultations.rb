class RemoveImageToConsultations < ActiveRecord::Migration[6.0]
  def change
    remove_column :consultations, :image, :string
  end
end
