class GroupsController < ApplicationController
  include GroupsHelper
  before_action :logged_in_user, only: %i[new create index show]

  def new
    @groups = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.Icon = params[:icon]
    if @group.save
      flash[:notice] = 'Group was created successfully'
      redirect_to groups_path
    else
      flash.now[:alert] = 'Group was not created'
      render 'new'
    end
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by(id: params[:id])
    @trans = Transaction.where(group_id: @group.id)
  end

  private
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
