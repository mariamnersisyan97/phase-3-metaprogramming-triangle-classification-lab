class Triangle
    attr_reader :a, :b, :c
  
    def initialize(a, b, c)
      @a = a
      @b = b
      @c = c 
    end

    def kind 
      validate_triangle
      if a == b && b == c
        :equilateral
      elsif a == b || b == c || a == c
        :isosceles
      else
        :scalene
      end
    end

    def triangle_no_size?
      [a, b, c].all?(&:positive?)
    end

    def triangle_negative_sides?
      a + b > c && a + c > b && b + c > a
    end

    def validate_triangle
      raise TriangleError unless triangle_no_size? && triangle_negative_sides?
    end

    class TriangleError < StandardError
    end
end

