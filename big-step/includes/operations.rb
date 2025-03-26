class Add < Struct.new(:left, :right)
    def evaluate(envi)
        Number.new(left.evaluate(envi).value + right.evaluate(envi).value)
    end
end

class Multiply < Struct.new(:left, :right)
    def evaluate(envi)
        Number.new(left.evaluate(envi).value * right.evaluate(envi).value)
    end
end

class LessThan < Struct.new(:left, :right)
    def evaluate(envi)
        Boolean.new(left.evaluate(envi).value < right.evaluate(envi).value)
    end
end

class MoreThan < Struct.new(:left, :right)
    def evaluate(envi)
        Boolean.new(left.evaluate(envi).value < right.evaluate(envi).value)
    end
end