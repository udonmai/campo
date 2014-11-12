class AddSendSystemessageEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :send_systemessage_email, :boolean, default: true
  end
end
