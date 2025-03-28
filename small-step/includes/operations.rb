class Add < Struct.new(:left, :right)
    def to_s
      "#{left} + #{right}"
    end
  
    def inspect
      "«#{self}»"
    end

    def reducible?
        true
    end

    def reduce(envi)
        if left.reducible?
            [Add.new(left.reduce(envi)[0], right), envi]
        elsif right.reducible?
            [Add.new(left, right.reduce(envi)[0]), envi]
        else
            [Number.new(left.value + right.value), envi]
        end
    end
end
  
class Multiply < Struct.new(:left, :right)
    def to_s
      "#{left} * #{right}" 
    end
  
    def inspect
      "«#{self}»"
    end

    def reducible?
        true
    end

    def reduce(envi)
        if left.reducible?
            [Multiply.new(left.reduce(envi)[0], right), envi]
        elsif right.reducible?
            [Multiply.new(left, right.reduce(envi)[0]), envi]
        else
            [Number.new(left.value * right.value), envi]
        end
    end
end

class LessThan < Struct.new(:left, :right)
    def to_s
        "#{left} < #{right}"
    end

    def inspect
        "«#{self}»"
    end

    def reducible?
        true
    end

    def reduce(envi)
        if left.reducible?
            [LessThan.new(left.reduce(envi)[0], right), envi]
        elsif right.reducible?
            [LessThan.new(left, right.reduce(envi)[0]), envi]
        else
            [Boolean.new(left.value < right.value), envi]
        end
    end
end

class MoreThan < Struct.new(:left, :right)
    def to_s
        "#{left} < #{right}"
    end

    def inspect
        "«#{self}»"
    end

    def reducible?
        true
    end

    def reduce(envi)
        if left.reducible?
            [LessThan.new(left.reduce(envi)[0], right), envi]
        elsif right.reducible?
            [LessThan.new(left, right.reduce(envi)[0]), envi]
        else
            [Boolean.new(left.value > right.value), envi]
        end
    end
end