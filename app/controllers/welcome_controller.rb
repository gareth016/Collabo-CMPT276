class WelcomeController < ApplicationController
	def index
         @disable_nav = false
	    if user_signed_in?
	       redirect_to :profile 
	    end
	end
	
	def start
        @disable_nav = true
       if user_signed_in?
           redirect_to :profile
       end
    end

  def signin
    if user_signed_in?
      redirect_to :profile
    else
      new_user_session_path
    end
  end
  helper_method :signin

    def profile
        @disable_nav = true
        if user_signed_in?
        else
            redirect_to :start
        end
    end
    

end
