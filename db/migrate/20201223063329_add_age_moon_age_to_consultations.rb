class AddAgeMoonAgeToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :age, :integer
    add_column :consultations, :moon_age, :integer
  end
end
