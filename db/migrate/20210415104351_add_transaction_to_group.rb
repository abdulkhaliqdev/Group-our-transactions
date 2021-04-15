class AddTransactionToGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :transaction_id, :integer
    add_foreign_key :groups, :transactions
  end
end
