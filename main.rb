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
	end

	def draw
		@background_image.draw(0, 0, ZOrder::BACKGROUND)
		@sun.draw
		@planets.each
	end

	def starting_position
		file = File.open("planets.txt", "r")
		file.each_line do |line|
			array = line.chomp.split(" ")
			@planets.push(Planet.new(array[0].to_f, array[1].to_f, array[2].to_f, array[3].to_f, array[4], array[5]))
		end
	end

	def update
		for i in 0..(array.length - 1) do
			for j in 0..(array.length - 1)
				if i != j
					@planets[i].forces(@planets[k])
					print @planets[i].file
					print @planets[k].file
					puts
				end
			end
		end	
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

	end
	

window = Window.new
window.show