class Sequence < Struct.new(:first, :second)
    def evaluate(envi)
        second.evaluate(first.evaluate(envi))
    end
end

class If < Struct.new(:condition, :consequence, :alternative)
    def evaluate(envi)
        case condition.evaluate(envi)
        when Boolean.new(true)
            consequence.evaluate(envi)
        when Boolean.new(false)
            alternative.evaluate(envi)
        end
    end
end

class While < Struct.new(:condition, :body)
    def evaluate(envi)
        case condition.evaluate(envi)
        when Boolean.new(true)
            evaluate(body.evaluate(envi))
        when Boolean.new(false)
            envi
        end
    end
end