class AddIsstudentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :isstudent, :boolean
  end
end
