class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true
      t.string :title
      t.integer :status

      t.timestamps
    end
  end
end
