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

	def force
		
	end
end