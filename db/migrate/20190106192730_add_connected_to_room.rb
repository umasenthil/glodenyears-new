class AddConnectedToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :connected, :boolean
  end
end
