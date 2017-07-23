class GroupsController < ApplicationController
  def index
    if params[:tag]
      @groups = Group.tagged_with(params[:tag])
    else
      @groups = Group.all
    end
    if params[:group_name]
      @groups = Group.group_name_with(params[:group_name])
    else
      @groups = Group.all
    end
  end

  def show
    # redirect_to @group.github_repo
  end

  def new
    @group = Group.new
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
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
  			format.js
  		else
  			redirect_to group_path(@group)
  		end
  	end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group.destroy
    redirect_to group_path(@group)
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

  def group_params
    params.require(:group).permit(:membership)
  end

  protected
  def group_params
  	params.require(:group).permit(:group_name, :group_info, :leader, :member_count)
  end

end

