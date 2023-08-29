class CreateCaisses < ActiveRecord::Migration[6.0]
  def change
    create_table :caisses do |t|
      t.integer :amount
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
