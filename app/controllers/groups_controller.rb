class GroupsController < ApplicationController
  def index
    @disable_nav = true
    if user_signed_in?
      if params[:group_name]
        @groups = Group.group_name_with(params[:group_name])
      else
        @groups = Group.all
      end        
    else
      redirect_to new_user_session_path
    end

  end
# @groupmem = GroupUser.find_by group_id: "#{@groups.id}"
  def show
    @disable_nav = true
    if user_signed_in?
      if params[:id]
        @groups = Group.find(params[:id])
        @groupmem = GroupUser.where(group_id: "#{@groups.id}").all
        @posts_of_group = Post.where(group_id: "#{@groups.id}").all
        if @posts_of_group.blank?
          @show_table = false
        else
          @show_table = true
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @disable_nav = true
    if user_signed_in?
    @group = Group.new
    @group.group_info = "Group has not added anything yet."
    else
      redirect_to new_user_session_path
    end

  end

  def update
    if user_signed_in?
    else
      redirect_to new_user_session_path
      return
    end
    respond_to do |format|
      @group = Group.find(params[:id])
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    if user_signed_in?
    else
      redirect_to new_user_session_path
      return
    end
    @groups = Group.find(params[:id])
    if user_in_group(current_user,@groups)
    else
      redirect_to groups_path
      puts "ERROR Tried to edit group when user is not a member of the group"
      return
    end
  end
  
  def create
    @group = Group.new(group_params)
    @group.member_count = 1
    @group.leader_id = current_user.id
    @m = GroupUser.new
    if @group.save
    else
        format.html { render :new }
    end
    @m.group_id = @group.id
    @m.user_id = current_user.id
    @group.save
    respond_to do |format|
      if @m.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        @group.destroy
        @m.destroy
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if user_signed_in?
    else
      redirect_to new_user_session_path
      return
    end
    @group = Group.find(params[:id])
    @groups_of_user = GroupUser.where(group_id: "#{@group.id}").all
    if user_in_group(current_user,@group)
    else
      redirect_to groups_path
      puts "ERROR Tried to destroy group when user is not a member of the group"
      return
    end
    @group.destroy
    @groups_of_user.each do |groupmem|
      groupmem.destroy
    end
    redirect_to groups_path
  end

  def join
    if user_signed_in?
    else
      redirect_to new_user_session_path
      return
    end
    @group = Group.find(params[:id])
    @m = GroupUser.new
    @m.group_id = @group.id
    @m.user_id = current_user.id
    @group.member_count = @group.member_count + 1
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

  def leave
    if user_signed_in?
    else
      redirect_to new_user_session_path
      return
    end
    @group = Group.find(params[:id])
    if !(user_in_group(current_user,@group))
      puts "ERROR user tried to leave group when he/she is currently not in the group!"
      return
    end
    
    if (@groupuser = GroupUser.find_by group_id: "#{@group.id}", user_id: "#{current_user.id}")
      @groupuser.destroy
      @group.member_count = @group.member_count - 1
      
      if(@group.member_count <= 0)
        @group.destroy
        redirect_to groups_path
        return
      else
        @group.save
      end
      
      if(current_user.id == @group.leader_id)
        @groupuser = GroupUser.find_by group_id: "#{@group.id}"
        @group.leader_id = (@groupuser.user_id)
        @group.save
      end
    end
    redirect_to groups_path
  end

  # def make_post
  #   redirct_to new_post_path(@group)
  # end

  
  private
  def set_group
    @group = Group.find(params[:id])
  end
  
  def user_in_group(user, group)
    return GroupUser.exists?(group_id: group.id, user_id: user.id)
  end
  def group_params
    params.require(:group).permit(:group_name, :group_info, :leader_id, :member_count)
  end
  
  protected
  def group_params
  	params.require(:group).permit(:group_name, :group_info, :leader_id, :member_count)
  end

end

