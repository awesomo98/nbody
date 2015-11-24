require 'gosu'
require_relative 'sun'
require_relative 'z_order'
require_relative 'planet'

class Window < Gosu::Window
	def initialize
		super 1024, 768
		self.caption = "The Solar System"

		@background_image = Gosu::Image.new("images/eagle.jpg")

		@sun = Sun.new
		@sun.warp(width/2.0, height/2.0)

		@planets = []
		@line = 0
		@universe = 0
		@win_x = 0
		@win_y = 0
	end

	def draw
		@background_image.draw(0, 0, ZOrder::BACKGROUND)
		@sun.draw
		@planets.each
	end

	def starting_position
		file = File.open("simulations/planets.txt", "r")
		file.each_line do |line|
			array = line.chomp.split(" ")
			if @line == 1
				@universe = array[0.to_f*2]
			else 
				# @win_x = array[0].to_f/@universe_size*@width + @width/2
				# @win_y = array[1].to_f/@universe_size*@height + @height/2
				@planets.push(Planet.new(array[0].to_f, array[1].to_f, array[2].to_f, array[3].to_f, array[4].to_f, array[5]))
				print @planets
			end
		end
	end

	def update
		starting_position
		for i in 0..(@planets.length - 1) do
			for j in 0..(@planets.length - 1)
				if i != j
					@planets[i].gravity(@planets[j])
					print @planets[i].file
					print @planets[j].file
					puts
				end
			end
		end	
	end

	def draw
		@planets.each {|planet| planet.draw}
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

end
	

window = Window.new
window.show