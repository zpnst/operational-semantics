require_relative "includes/quants.rb"
require_relative "includes/utils.rb"
require_relative "includes/operations.rb"
require_relative "includes/flow.rb"

class Machine < Struct.new(:expr, :envi)

    attr_accessor :istep

    def initialize(expr, envi = {})
        super(expr, envi)
    end

    def log_state
        max_expr_length = @max_expr_length ||= expr.to_s.length * 3
        printf "<step: #%d> -->\t| expr: %-#{@max_expr_length}s\t| envi: %s\n", istep, expr, envi
    end

    def do_step
        self.expr, self.envi = expr.reduce(envi)
    end

    def run
        self.istep = 0
        puts "Abstract Machine runtime:"
        while expr.reducible?
            log_state
            self.istep += 1
            do_step
        end
        log_state
    end
end


