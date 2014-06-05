# SET UP ROVER START

class Rover
	def initialize(start)
		@location = {
			:x => start[0].to_i,
			:y => start[2].to_i,
			:d => start[4]
		}
	end

#TAKE INSTRUCTIONS
	def instructions(i)
		i.each_char do |command|
			case command
			when 'L'
				rotate('L')
			when 'R'
				rotate('R')
			when 'M'
				move
			else
				puts "Are you an idiot?"
			end
		end
	# WHERE YOU AT ROVER
	p "#{@location[:x]} #{@location[:y]} #{@location[:d]}"
	end

#TURNS
	def rotate(direction)
		compass = ['N','E','S','W']
		i = compass.index(@location[:d])
		if direction == 'L'
			@location[:d] = compass[i-1]
		elsif direction == 'R'
			if i == 3
				@location[:d] = 'N'
			else
				@location[:d] = compass[i + 1]
			end
		else
			puts "Don't do that."
		end		
	end

#MOVE
	def move
		case @location[:d]
		when 'N'
			can_move?('y',1) ? @location[:y] += 1 : forw_err
		when 'E'
			can_move?('x',1) ? @location[:x] += 1 : forw_err
		when 'S'
			can_move?('y',-1)? @location[:y] -= 1 : forw_err
		when 'W'
			can_move?('x',-1)? @location[:x] -= 1 : forw_err
		else
			puts "You hit the wall."
		end
	end

#PLATEAU BOUNDARIES
	def can_move?(axis, number)
		if axis == 'y'
			new_y = @location[:y] + number
			(new_y >= 0) && (new_y <= @@y)
		elsif axis == 'x'
			new_x = @location[:x] + number
			(new_x >= 0) && (new_x <= @@x)
		else
			puts 'unknown direction'
		end
	end

#MAXES
	def self.plateu(max_coord)
		@@x = max_coord[0].to_i
		@@y = max_coord[2].to_i
	end
end

# SET PLATEAU INPUTS
Rover.plateu('5 5')
# ROVERS
r1 = Rover.new('1 2 N')
r1.instructions('LMLMLMLMM')
r2 = Rover.new('3 3 E')
r2.instructions('MMRMMRMRRM')