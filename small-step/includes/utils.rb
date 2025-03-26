class DoNothing
    def to_s
        'do-nothing'
    end

    def inspect
        "«#{self}»"
    end

    def ==(other_statement)
        other_statement.instance_of?(DoNothing)
    end

    def reducible?
        false
    end
end

class Assign < Struct.new(:name, :expr)
    def to_s
        "#{name} = #{expr}"
    end
    def inspect
        "«#{self}»"
    end
    def reducible?
        true
    end
    def reduce(envi)
        if expr.reducible?
            [Assign.new(name, expr.reduce(envi)), envi]
        else
            [DoNothing.new, envi.merge({ name => expr })]
        end
    end
end

class Variable < Struct.new(:name)
    def to_s
        name.to_s
    end

    def inspect
        "«#{self}»"
    end

    def reducible?
        true
    end

    def reduce(envi)
        envi[name]
    end
end
