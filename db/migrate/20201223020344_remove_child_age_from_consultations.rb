class RemoveChildAgeFromConsultations < ActiveRecord::Migration[6.0]
  def change
    remove_column :consultations, :child_age, :integer
    remove_column :consultations, :child_moon_age, :integer
  end
end
