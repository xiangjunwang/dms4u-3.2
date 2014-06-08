class AddSenderInfoToPaypalTransactions < ActiveRecord::Migration
  def change
    add_column :paypal_transactions, :sender_name, :string
    add_column :paypal_transactions, :sender_email, :string
  end
end
