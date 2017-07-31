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
      return
    end
    @groups_of_user = GroupUser.where(user_id: "#{current_user.id}").all
    @posts_of_user = Post.where(user_id: "#{current_user.id}").all
    if @posts_of_user.blank?
      @show_table = false
    else
      @show_table = true
    end
  end

  def grouplist
    @disable_nav = true
  end

  def groupdetail
    @disable_nav = true
  end

end