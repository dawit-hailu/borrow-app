class CitiesController < ApplicationController
	def index
		@cities= @state.cities.all
	end

	def new
	end
	
	def create
		
	end
end