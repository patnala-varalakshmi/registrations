class AddDeleteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted, :boolean, default: false
  end
end
