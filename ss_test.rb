require_relative "small-step/machine.rb"

Machine.new(
    Add.new(
        Multiply.new(Number.new(1), Number.new(2)),
        Multiply.new(Number.new(3), Number.new(4))
    )
).run

Machine.new(
    LessThan.new(
        Number.new(5), 
        Add.new(
            Number.new(2), 
            Number.new(2)
        )
    )
).run

Machine.new(
    # expression to reduce
    Add.new(
        Variable.new(:x), 
        Variable.new(:y)
    ),

    # environment
    {
        x: Number.new(3), 
        y: Number.new(4) 
    }
).run

Machine.new(
    LessThan.new(
        Number.new(42),
        Add.new(
            Multiply.new(Number.new(5), Number.new(7)),
            Multiply.new(Number.new(1), Variable.new(:x))
        )
    ),
    {
        x: Number.new(11)
    }
).run

Machine.new(
    Assign.new(
        :x, 
        Add.new(
            Variable.new(:x), 
            Number.new(1)
        )
    ),
    {
        x: Number.new(41)
    }
).run

Machine.new(
    If.new(
        Variable.new(:x),
        Assign.new(:y, 
            Add.new(
                Multiply.new(Number.new(1), Number.new(2)),
                Multiply.new(Number.new(3), Number.new(4))
            )
        ),
        Assign.new(:y, Number.new(2))
    ),
    { 
        x: Boolean.new(true) 
    }
).run

Machine.new(
    Sequence.new(
        Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
        Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
    ),
).run

Machine.new(
    While.new(
        LessThan.new(
            Variable.new(:x),
            Number.new(5)
        ),
        Assign.new(
            :x, 
            Multiply.new(
                Variable.new(:x), 
                Number.new(3)
            )
        )
    ),
    { 
        x: Number.new(1) 
    }
).run