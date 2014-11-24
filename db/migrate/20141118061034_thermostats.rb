class Thermostats < ActiveRecord::Migration
  def change
     rename_column :thermostats, :user, :auid
  end
end
