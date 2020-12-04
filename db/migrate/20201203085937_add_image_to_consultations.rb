class AddImageToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :image, :string
  end
end
