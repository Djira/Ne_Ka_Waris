class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.string :name
      t.integer :amount
      t.string :priority
      t.string :status

      t.timestamps
    end
  end
end
