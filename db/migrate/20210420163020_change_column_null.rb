class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :transactions, :group_id, true
  end
end
