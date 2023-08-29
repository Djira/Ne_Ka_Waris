class CreateAddCaissesNameToExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :add_caisses_name_to_expenses do |t|
      t.string :caiss_name

      t.timestamps
    end
  end
end
