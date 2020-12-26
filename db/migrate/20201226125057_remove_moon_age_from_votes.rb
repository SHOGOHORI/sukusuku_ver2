class RemoveMoonAgeFromVotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :child_moon_age, :integer
    remove_column :votes, :child_age, :integer
  end
end
