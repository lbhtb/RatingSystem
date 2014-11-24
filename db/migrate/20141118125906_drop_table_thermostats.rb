class DropTableThermostats < ActiveRecord::Migration
  def change
    drop_table :thermostats
  end
end
