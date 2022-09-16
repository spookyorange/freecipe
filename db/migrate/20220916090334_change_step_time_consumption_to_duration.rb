class ChangeStepTimeConsumptionToDuration < ActiveRecord::Migration[7.0]
  def change
    change_table :steps do |t|
      t.remove :time_consumption
      t.integer :duration
    end
  end
end
