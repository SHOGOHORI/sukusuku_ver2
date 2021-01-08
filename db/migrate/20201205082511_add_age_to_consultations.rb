class AddAgeToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :child_age, :integer
    add_column :consultations, :child_moon_age, :integer
    add_column :consultations, :pregnant, :boolean
  end
end
