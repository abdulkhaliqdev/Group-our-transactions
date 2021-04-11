class GroupsController < ApplicationController
  before_action :logged_in_user

  def new
    @groups = current_user.Group.new
  end

  def index
    @groups = Group.all
  end

  def create
    @groups = current_user.items.build(group_params)
    if @item.save
      flash[:notice] = 'Group has been created!'
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def item_params
    params.require(:group).permit(:name, :icon, :user)
  end
end
