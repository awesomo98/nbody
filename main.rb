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
	end

	def update
		
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end
	

window = Window.new
window.show
end