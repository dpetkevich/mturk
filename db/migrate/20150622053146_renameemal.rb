class Renameemal < ActiveRecord::Migration
  def change
  	rename_column :turks, :email, :bitcoin_address
  end
end
