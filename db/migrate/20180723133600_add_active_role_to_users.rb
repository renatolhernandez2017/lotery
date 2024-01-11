class AddActiveRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :active_role, :string
  end
end
