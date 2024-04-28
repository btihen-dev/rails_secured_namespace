class AddRolesToUser < ActiveRecord::Migration[7.1]
  def change
    # add_column :users, :roles, :text
    add_column :users, :roles, :text, array: true, default: ['user']
  end
end
