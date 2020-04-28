class RemoveAndCreateUpdates < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :create_at, :datetime
    remove_column :articles, :update_at, :datetime
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
