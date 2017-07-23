class WelcomeController < ApplicationController
	def index
         @disable_nav = true
	end
	
	def start
        @disable_nav = true
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
    
end
