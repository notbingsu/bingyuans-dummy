class AddAAndBToDummies < ActiveRecord::Migration[7.1]
  def change
    add_column :dummies, :a, :integer
    add_column :dummies, :b, :integer
  end
end
