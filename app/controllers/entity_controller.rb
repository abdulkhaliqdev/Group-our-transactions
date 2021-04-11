class EntityController < ApplicationController
  before_action :logged_in_user

  def new
    @entity = Entity.new
    @groups = Group.all.collect { |group| [group.name, group.id] }
  end

  def create
    @entity = current_user.entities.build(entity_params)
    if @entity.save
      flash[:notices] = "#{@entity.name} Transaction successfully"
      redirect_to @transaction
    else
      render 'new'
    end
  end

  def show
    @entity = Entity.find_by(id: params[:id])
  end

  def index
    @entity = Entity.in_u_g.where(user_id: current_user.id).dsc
  end

  def no_grp
    @entity = Entity.in_u_g.where({ group_id: nil, user_id: current_user.id }).dsc
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
