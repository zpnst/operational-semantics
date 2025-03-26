require_relative "includes/quants.rb"
require_relative "includes/utils.rb"
require_relative "includes/operations.rb"
require_relative "includes/flow.rb"

class Evaluator < Struct.new(:expr, :envi)
    def initialize(expr, envi = {})
        super(expr, envi)
    end

    def run
        result = expr.evaluate(envi)
        puts result
    end
end


