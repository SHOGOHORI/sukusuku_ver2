class AddImpressionsCountToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :impressions_count, :integer, default: 0
  end
end
