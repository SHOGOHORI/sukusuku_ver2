class RenameImagesColumnToConsultations < ActiveRecord::Migration[6.0]
  def change
    rename_column :consultations, :images, :image
  end
end
