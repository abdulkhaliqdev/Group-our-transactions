class TransactionsController < ApplicationController
  before_action :logged_in_user, only: %i[new create show index]

  def show
    @transaction = Transaction.find_by(id: params[:id])
    @group = Group.where(id: @transaction.group_id)
  end

  def index
    @transactions = Transaction.with_user(current_user.id).where(user_id: current_user.id)
  end

  def external
    @external_transactions = Transaction.where.not(user_id: current_user.id)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    if @transaction.save
      flash[:notice] = "#{@transaction.name} Transaction successfully created"
      redirect_to transactions_path
    else
      flash.now[:alert] = "#{@transaction.name} Transaction unable created"
      render 'new'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :group_id, :user_id)
  end
end
