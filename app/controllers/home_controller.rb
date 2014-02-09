class HomeController < ApplicationController
	def index
		if abogado_signed_in?
			redirect_to :controller=>'procesos' ,:action =>'index'
		end
	end
end
