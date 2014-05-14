class AddSenderInfoToPaypals < ActiveRecord::Migration
  def change
    add_column :paypals, :sender_name, :string
    add_column :paypals, :sender_email, :string
  end
end
