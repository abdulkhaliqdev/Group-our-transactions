module TransactionsHelper
  def check_group_id(trans)
    return true if trans.group_id.nil?
  end
end
