class RenameMoonAgeColumnToConsultations < ActiveRecord::Migration[6.0]
  def change
    rename_column :consultations, :moon_age, :child_age_moon_age
  end
end
