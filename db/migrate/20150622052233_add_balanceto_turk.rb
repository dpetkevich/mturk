class AddBalancetoTurk < ActiveRecord::Migration
  def change
  	change_column_default(:turks, :balance, 0)
  end
end
