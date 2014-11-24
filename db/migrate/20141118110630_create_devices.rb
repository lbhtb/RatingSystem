class CreateDevices < ActiveRecord::Migration
  def change
    create_table :device do |t|
      t.integer :rate
      t.string :equipment_id
      t.timestamps
    end
  end
end
