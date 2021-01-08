class AddSearchAgeToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :search_age, :integer
  end
end
