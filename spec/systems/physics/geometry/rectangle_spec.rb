require 'rspec'
require_relative '../../../systems/physics/rectangle.rb'
require_relative '../../../systems/physics/point.rb'

describe Rectangle do
    let(:rect1) { Rectangle.new(Point.new(-2,2),Point.new(2,-2)) }
    describe '#overlaps' do
        #true overlaps
        it 'is true for same rect' do
            rect2 = rect1
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for fully contained' do
            rect2 = Rectangle.new(Point.new(-1,1),Point.new(1,-1))
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for partial bottom right' do
            rect2 = Rectangle.new(Point.new(0,0),Point.new(3,-3))
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for partial top right' do
            rect2 = Rectangle.new(Point.new(0,3),Point.new(3,0))
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for partial top left' do
            rect2 = Rectangle.new(Point.new(-3,3),Point.new(0,0))
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for partial bottom left' do
            rect2 = Rectangle.new(Point.new(-3,0),Point.new(0,-3))
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for touching right' do
            rect2 = Rectangle.new(Point.new(2,2),Point.new(4,-2))
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for touching left' do
            rect2 = Rectangle.new(Point.new(-4,2),Point.new(-2,-2))
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for touching top' do
            rect2 = Rectangle.new(Point.new(-2,4),Point.new(2,2))
            expect(rect1.overlaps(rect2)).to be true
        end

        it 'is true for touching bottom' do
            rect2 = Rectangle.new(Point.new(-2,-2),Point.new(2,-4))
            expect(rect1.overlaps(rect2)).to be true
        end

        #false overlaps
        it 'is false for above left' do
            rect2 = Rectangle.new(Point.new(-5,5),Point.new(-3,3))
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for directly above' do
            rect2 = Rectangle.new(Point.new(-2,5),Point.new(2,3))
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for above right' do
            rect2 = Rectangle.new(Point.new(3,5),Point.new(5,3))
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for directly right' do
            rect2 = Rectangle.new(Point.new(3,2),Point.new(5,-2))
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for below right' do
            rect2 = Rectangle.new(Point.new(3,-3),Point.new(5,-5))
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for directly below' do
            rect2 = Rectangle.new(Point.new(-2,-3),Point.new(2,-5))
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for below left' do
            rect2 = Rectangle.new(Point.new(-5,-3),Point.new(-3,-5))
            expect(rect1.overlaps(rect2)).to be false
        end

        it 'is false for directly left' do
            rect2 = Rectangle.new(Point.new(-5,2),Point.new(-3,-2))
            expect(rect1.overlaps(rect2)).to be false
        end
    end
end
