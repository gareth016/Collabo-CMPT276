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
    end
	end
	
  def profile
    @disable_nav = true
    if user_signed_in?
    else
      redirect_to :start
    end
  end

    def profile
        if user_signed_in?
          @disable_nav = false
        else
            redirect_to :start
        end
    end
    
  def grouplist
    @disable_nav = true
  end

  def groupdetail
    @disable_nav = true
  end


end
