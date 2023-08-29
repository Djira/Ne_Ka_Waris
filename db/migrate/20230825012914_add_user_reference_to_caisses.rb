class AddUserReferenceToCaisses < ActiveRecord::Migration[6.0]
  def change
    add_reference :caisses, :user, foreign_key: true
  end
end
