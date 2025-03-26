require_relative "big-step/evaluator.rb"

Evaluator.new(
    If.new(
        Boolean.new(true),
        Sequence.new(
            Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
            Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
        ),
        DoNothing.new()
    )
).do