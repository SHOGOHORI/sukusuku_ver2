class AddMoonAgeToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :moon_age, :integer
    remove_column :consultations, :search_age, :integer
  end
end
