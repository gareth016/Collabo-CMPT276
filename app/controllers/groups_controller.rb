class GroupsController < ApplicationController
before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    #if params[:tag]
    #  @groups = Group.tagged_with(params[:tag])
    #else
    #  @groups = Group.all
    #end
    if params[:group_name]
      @groups = Group.group_name_with(params[:group_name])
    else
      @groups = Group.all
    end
  end
# @groupmem = GroupUser.find_by group_id: "#{@groups.id}"
  def show
    if params[:id]
      @groups = Group.find(params[:id])
      @groupmem = GroupUser.where(group_id: "#{@groups.id}").all
    end
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

def join
    @group = Group.find(params[:id])
    @m = @group.memberships.build(:user_id => current_user.id)
    respond_to do |format|
      if @m.save
        format.html { redirect_to(@group, notice: 'You have successfully joined this group.') }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { redirect_to(@group, notice: 'Error, you failed to join this group.') }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end
  protected
  def group_params
    params.permit(:membership, :id, 
      :tags, :group_name, :leader, :leader_id, 
      :member_count, :group_info, :github_repo)
  end

end

