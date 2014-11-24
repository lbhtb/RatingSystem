class AddAuidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auid, :string
  end
end
