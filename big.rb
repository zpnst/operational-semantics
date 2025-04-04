require_relative "big-step/evaluator.rb"

puts "----------------------------------------------------------------------------------------------"
puts "Big Steps for --> --|1 * 2 + 3 * 4|--\n" 

Evaluator.new(
    Add.new(
        Multiply.new(Number.new(1), Number.new(2)),
        Multiply.new(Number.new(3), Number.new(4))
    )
).run

puts "----------------------------------------------------------------------------------------------"
puts "\nBig Steps for --> --|5 < 2 + 2|--\n" 

Evaluator.new(
    LessThan.new(
        Number.new(5), 
        Add.new(
            Number.new(2), 
            Number.new(2)
        )
    )
).run

puts "----------------------------------------------------------------------------------------------"
puts "\nBig Steps for --> --|x + y|--\n" 

Evaluator.new(
    Add.new(
        Variable.new(:x), 
        Variable.new(:y)
    ),
    {
        x: Number.new(3), 
        y: Number.new(4) 
    }
).run

puts "----------------------------------------------------------------------------------------------"
puts "\nBig Steps for --> --|42 < 5 * 7 + 1 * x|--\n" 

Evaluator.new(
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

puts "----------------------------------------------------------------------------------------------"
puts "\nBig Steps for --> --|x = x + 1|--\n" 

Evaluator.new(
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

puts "----------------------------------------------------------------------------------------------"
puts "\nBig Steps for --> --|if (x) { y = 1 * 2 + 3 * 4 } else { y = 2 }|--\n" 

Evaluator.new(
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

puts "----------------------------------------------------------------------------------------------"
puts "\nBig Steps for --> --|x = 1 + 1; y = x + 3|--\n" 

Evaluator.new(
    Sequence.new(
        Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
        Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
    ),
).run

puts "----------------------------------------------------------------------------------------------"
puts "\nBig Steps for --> --|while (x < 5) { x = x * 3 }|--\n" 

Evaluator.new(
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