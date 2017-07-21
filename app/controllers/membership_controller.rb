class MembershipsController < ApplicationController
before_action :authenticate_user!

	def new
      @group = Group.find params[:group_id]
      @membership = Membership.new({group: group})
    end

  def create
    @membership = current_user.memberships.build(:group_id => params[:group_id])
    if @membership.save
      format.html { redirect_to @group, notice: 'You joined this group successfully.' }
      format.json { render :show, status: :created, location: @group }
      redirect_to :back
    else
      format.html { redirect_to @group, notice: 'You failed to join this group.' }
      format.json { render json: @group.errors, status: :unprocessable_entity }
      redirect_to :back
    end
  end


  def destroy
    @membership = current_user.memberships.find(params[:id])
    @membership.destroy
        format.html { redirect_to @group, notice: 'You are no longer apart of that group.' }
        redirect_to :back
  end


    private

    def membership_params
        params.require(:membership).merge(group_id: params[:group_id], user_id: current_user.id)
    end
end

