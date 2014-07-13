class AddProjectIdToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :project, index: true
  end
end
