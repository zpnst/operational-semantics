class Sequence < Struct.new(:first, :second)
    def to_s
        "#{first}; #{second}"
    end
    def inspect
        "«#{self}»"
    end
    def reducible?
        true
    end
    def reduce(envi)
        case first
        when DoNothing.new
            [second, envi]
        else
            reduced_first, reduced_envi = first.reduce(envi)
            [Sequence.new(reduced_first, second), reduced_envi]
        end
    end
end

class If < Struct.new(:condition, :consequence, :alternative)
    def to_s
        "if (#{condition}) { #{consequence} } else { #{alternative} }"
    end
    def inspect
        "«#{self}»"
    end
    def reducible?
        true
    end
    def reduce(envi)
        if condition.reducible?
            [If.new(condition.reduce(envi)[0], consequence, alternative), envi]
        else
            case condition
            when Boolean.new(true)
                [consequence, envi]
            when Boolean.new(false)
                [alternative, envi]
            end
        end
    end
end

class While < Struct.new(:condition, :body)
    def to_s
        "while (#{condition}) { #{body} }"
    end
    def inspect
    "«#{self}»"
        end
    def reducible?
        true
    end
    def reduce(envi)
        [If.new(condition, Sequence.new(body, self), DoNothing.new), envi]
    end
end