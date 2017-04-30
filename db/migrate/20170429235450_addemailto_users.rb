class AddemailtoUsers < ActiveRecord::Migration[5.0]
  def change
  add_column :users,  :email,  :string,  default: "", null: false
  add_column :users,  :encrypted_password, :string, default: "", null: false

  end
end
