class RenameStocksToConsultationStock < ActiveRecord::Migration[6.0]
  def change
    rename_table :stocks, :consultation_stocks
  end
end
