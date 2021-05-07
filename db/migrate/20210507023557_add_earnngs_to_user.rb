class AddEarnngsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :earnings, :float
  end
end
