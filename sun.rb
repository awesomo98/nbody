class Sun
	def initialize
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@image = Gosu::Image.new("images/death_star.png")
	end

	def warp(x, y)
		@x, @y = x, y
	end

	def draw
		@image.draw(@x, @y, ZOrder::SUN)
	end
end