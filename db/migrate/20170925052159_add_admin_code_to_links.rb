class AddAdminCodeToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :admin_code, :string
  end
end
