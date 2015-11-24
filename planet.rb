class Planet
	attr_accessor :xpos, :ypos, :xvel, :yvel, :mass, :file#, :win_x, :win_y, :force_y, :force_x, :acc_x, :acc_y, :velocity_x, :velocity_y

	def initialize(xpos, ypos, xvel, yvel, mass, file)#, win_x, win_y, force_y, force_x, acc_x, acc_y, velocity_x, velocity_y)
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@xpos = xpos
		@ypos = ypos
		@xvel = xvel
		@yvel = yvel
		@mass = mass
		@file = file
		# @win_x = win_x
		# @win_y = win_y
		# @force_y = force_y
		# @force_x = force_x
		# @acc_x = 0
		# @acc_y = 0
		# @velocity_x = 0
		# @velocity_y = 0
		@image = Gosu::Image.new("images/#{@file}")
	end

	G = 6.67408*10**(-11)

	def gravity(planet)
		radius = Math.sqrt(((self.xpos - planet.xpos)**2) + ((self.ypos - planet.ypos)**2))
		force = ((G*self.mass*planet.mass)/radius**2)
		@force_y = force * ((self.ypos - planet.ypos) / radius)
		@force_x = force * ((self.xpos - planet.xpos) / radius)
	end

	def draw
		@image.draw(@x, @y, ZOrder::PLANETS)
	end

	def acceleration
		@acc_x = @force_x/@mass
		@acc_y = @force_y/@mass
	end

	def velocity
	@velocity_x_current = ((self.xvel + @acc_x) * 1000000000)
	@velocity_y_current = ((self.yvel + @acc_y) * 10000000)
	end


end