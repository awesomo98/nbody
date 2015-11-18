class Planet
	attr_accessor :xpos, :ypos, :xvel, :yvel, :mass, :file

	def initialize(xpos, ypos, xvel, yvel, mass, file)
		@xpos = xpos
		@ypos = ypos
		@xvel = xvel
		@yvel = yvel
		@mass = mass
		@file = file
	end

	G = 6.67408*10**-11

	def gravity
		G*mass.planets/urmojm
	end
end