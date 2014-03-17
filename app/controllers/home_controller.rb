class HomeController < ApplicationController
	def index
		@software_abogado = SoftwareAbogado.new
		if abogado_signed_in?
			redirect_to :controller=>'procesos' ,:action =>'index'
		end
	end
end
