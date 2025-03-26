class DoNothing
    def evaluate(envi)
        envi
    end
end

class Assign < Struct.new(:name, :expr)
    def evaluate(envi)
        envi.merge({ name => expr.evaluate(envi) })
    end
end

class Variable < Struct.new(:name)
    def evaluate(envi)
        envi[name]
    end
end