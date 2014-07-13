class RemoveUserFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :user, :integer
  end
end
