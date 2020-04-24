require 'rspec'
require_relative '../../../../systems/physics/geometry/rectangle.rb'
require_relative '../../../../systems/physics/geometry/square.rb'
require_relative '../../../../systems/physics/geometry/point.rb'

describe Rectangle do
    let(:rect1) { Square.new(Point.new(0,0)).with_sides(2).set_corners }
    describe '#overlaps' do
        #true overlaps
        it 'is true for same rect' do
            rect2 = rect1
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for fully contained' do
            rect2 = Square.new(Point.new(0,0)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for partial bottom right' do
            rect2 = Square.new(Point.new(1.5,-1.5)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for partial top right' do
            rect2 = Square.new(Point.new(1.5,1.5)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for partial top left' do
            rect2 = Square.new(Point.new(-1.5,1.5)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for partial bottom left' do
            rect2 = Square.new(Point.new(-1.5,-1.5)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for touching right' do
            rect2 = Square.new(Point.new(2,0)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for touching left' do
            rect2 = Square.new(Point.new(-2,0)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for touching top' do
            rect2 = Square.new(Point.new(0,2)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for touching bottom' do
            rect2 = Square.new(Point.new(0,-2)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be true
        end

        #false overlaps
        it 'is false for above left' do
            rect2 = Square.new(Point.new(-3,3)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for directly above' do
            rect2 = Square.new(Point.new(0,3)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for above right' do
            rect2 = Square.new(Point.new(3,3)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for directly right' do
            rect2 = Square.new(Point.new(3,0)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for below right' do
            rect2 = Square.new(Point.new(3,-3)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for directly below' do
            rect2 = Square.new(Point.new(0,-3)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for below left' do
            rect2 = Square.new(Point.new(-3,-3)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for directly left' do
            rect2 = Square.new(Point.new(-3,0)).with_sides(2).set_corners
            expect(rect1.overlaps(rect2)).to be false
        end
    end
end
