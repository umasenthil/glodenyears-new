class RemoveSkypeidFromStudent < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :skypeid, :string
  end
end
