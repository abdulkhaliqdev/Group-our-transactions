class TransactionsController < ApplicationController
  before_action :logged_in_user, only: %i[new create show index]

  def show
    @transaction = Transaction.find_by(id: params[:id])
  end

  def index
    @transactions = Transaction.all
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
      flash.now[:alert] = "#{@transaction.name}==#{@transaction.amount}==#{@transaction.group_id}==#{@transaction.user_id}"
      render 'new'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :group_id, :user_id)
  end
end
