class RenameEmailToEmailAddressInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :email, :email_address
  end
end
