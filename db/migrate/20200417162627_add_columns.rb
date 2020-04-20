class AddColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :descripcion, :text
    add_column :articles, :create_at, :datetime
    add_column :articles, :update_at, :datetime
  end
end
