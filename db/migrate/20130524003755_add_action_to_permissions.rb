class AddActionToPermissions < ActiveRecord::Migration
  def change
    add_column :permissions, :action, :text
  end
end
