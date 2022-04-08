class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.text :description
      t.integer :time_consumption
      t.integer :order
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
