class WelcomeController < ApplicationController
	def index
         @disable_nav = true
	end
	
	def start
        @disable_nav = true
    end
end
