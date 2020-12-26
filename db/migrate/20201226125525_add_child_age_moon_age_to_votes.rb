class AddChildAgeMoonAgeToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :child_age_moon_age, :integer
  end
end
