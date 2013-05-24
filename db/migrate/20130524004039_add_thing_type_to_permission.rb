class AddThingTypeToPermission < ActiveRecord::Migration
  def change
    add_column :permissions, :thing_type, :text
  end
end
