class WelcomeController < ApplicationController
	def index
    @disable_nav = true
    if user_signed_in?
      redirect_to :profile
    end
	end
	
  def profile
    @disable_nav = true
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
    @groups_of_user = GroupUser.where(user_id: "#{current_user.id}").all
  end

  def grouplist
    @disable_nav = true
  end

  def groupdetail
    @disable_nav = true
  end

end