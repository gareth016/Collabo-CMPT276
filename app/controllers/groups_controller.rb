class GroupsController < ApplicationController
  def index
  	@groups = Group.all
  end

  def create
  	@group = Group.new(group_params)
  	respond_to do |format|
  		if @group.save
  			format.js
  		else
  			format.html { render root_path }
  		end
  	end
  end

  private
  def group_params
  	params.require(:group).permit(:group_name, :group_info, :all_tags)
  end

end
