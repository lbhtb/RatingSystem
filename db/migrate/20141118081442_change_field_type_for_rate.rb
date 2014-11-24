class ChangeFieldTypeForRate < ActiveRecord::Migration
  def change
     change_table :thermostats do |t|
      t.change :rate, :integer
    end
  end
end
