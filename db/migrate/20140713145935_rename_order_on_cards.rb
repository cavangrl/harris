class RenameOrderOnCards < ActiveRecord::Migration
  def change
  	rename_column :cards, :order, :position
  end
end
