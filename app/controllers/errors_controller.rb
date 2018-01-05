class ErrorsController < ApplicationController


	def show
	 render actoin: request.path[1..-1]

	end

end
