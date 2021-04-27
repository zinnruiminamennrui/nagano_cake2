class RemoveNameFromManagers < ActiveRecord::Migration[5.2]
  def change
    remove_column :managers, :name, :string
  end
end
