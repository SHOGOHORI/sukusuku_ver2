class RenameBrithdayColumnToChildren < ActiveRecord::Migration[6.0]
  def change
    rename_column :children, :brithday, :birthday
  end
end
