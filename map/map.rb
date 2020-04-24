require_relative '../entities/corruption.rb'
require_relative '../entities/human.rb'
require_relative '../entities/player.rb'
require_relative '../systems/physics/geometry/point.rb'
require_relative '../systems/physics/geometry/square.rb'

class Map
    attr_reader :humans
    attr_reader :corruptions
    
    def initialize(width, height)
        @width = width
        @height = height
        with_humans(10)
        with_corruptions(8)
        point = Point.new(31,23)
        @player = Player.new(point)
    end

    def with_humans(humans)
        @human_total = humans
    end

    def with_corruptions(corruptions)
        @corruption_total = corruptions
    end

    def randomize
        @humans = Array.new(@human_total) { |human|
            x = Gosu::random(0,63)
            y = Gosu::random(0,47)
            point = Point.new(x,y)
            human = Human.new(point)
        }

        @corruptions = Array.new(@corruption_total) { |corruption|
            x = Gosu::random(0,63)
            y = Gosu::random(0,47)
            point = Point.new(x,y)
            corruption = Corruption.new(point)
        }
    end

    def draw
        @humans.each do |human|
            human.draw
        end
        @corruptions.each do |corruption|
            corruption.draw
        end
        @player.draw
    end

    def player
        @player
    end
end