class AddBalanceToTurk < ActiveRecord::Migration
  def change
  	add_column :turks, :balance, :decimal
  end
end
