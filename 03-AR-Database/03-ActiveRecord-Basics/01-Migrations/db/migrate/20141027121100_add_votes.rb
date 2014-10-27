class AddVotes < ActiveRecord::Migration
  def change
    add_column :posts, :votes, :integer
  end
end