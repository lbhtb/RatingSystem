class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :equip_id
      t.integer :rate

      t.timestamps
    end
  end
end
