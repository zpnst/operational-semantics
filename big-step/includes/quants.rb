class Number  < Struct.new(:value)
    def to_s
        value.to_s
    end
    def inspect
        "«#{self}»"
    end
    def evaluate(envi)
        self
    end
end

class Boolean  < Struct.new(:value)
    def to_s
        value.to_s
    end
    def inspect
        "«#{self}»"
    end
    def evaluate(envi)
        self
    end
end