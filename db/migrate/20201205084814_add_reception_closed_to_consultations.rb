class AddReceptionClosedToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :reception_closed, :boolean
  end
end
