class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :day
      t.integer :amount
      t.string :need
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
