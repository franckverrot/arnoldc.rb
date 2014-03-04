require 'tokens'
module ArnoldC
  class Parser
    def initialize(filename)
      @filename = filename || raise(ArgumentError, 'You should provide a script name. eg: ./arnoldc.rb my_file.arnoldc')
    end

    def execute
      # READ FILE
      data = File.read(@filename)

      # DROP LEADING SPACES
      data.gsub!(/^\s*(.*)/) { $1 }

      # MAIN PROGRAM
      data.gsub!(/#{BeginMain}/,"def main")
      data.gsub!(/#{EndMethodDeclaration}|#{EndWhile}|#{EndMain}|#{EndIf}/,"end")

      # MACROS
      data.gsub!(/@#{True}/,"true")
      data.gsub!(/@#{False}/,"false")

      # CONDITIONALS
      data.gsub!(/#{If} (\w*)/) { "if #{$1}" }
      data.gsub!(/#{Else}/,"else")

      # LOOP
      data.gsub!(/#{While} (\w*)/) { "while #{$1}" }

      # ASSIGNMENTS
      data.gsub!(/#{DeclareInt} (\w+)\n#{SetInitialValue} (\w*)/) { "#{$1} = #{$2}" }
      data.gsub!(/#{AssignVariable} (\w+)/) { "#{$1} = \\" }
      data.gsub!(/#{AssignVariableFromMethodCall} (\w+)/) { "#{$1} = \\" }

      # METHODS
      data.gsub!(/#{DeclareMethod} (\w+)/) { "def #{$1}(" }
      data.gsub!(/#{MethodArguments} (\w+)/) { "#{$1}," }

      # METHOD CALLS
      data.gsub!(/#{CallMethod} (\w*) (\w+) (\w+)/) { "#{$1}(#{$2}, #{$3})" }
      data.gsub!(/#{SetValue} (\w+)/) { "#{$1}\\" }

      # ARITHMETICS
      data.gsub!(/#{MinusOperator} (\w+)/) { "- #{$1}" }
      data.gsub!(/#{PlusOperator} (\w+)/) { "+ #{$1}" }
      data.gsub!(/#{MultiplicationOperator} (\w+)/) { "* #{$1}" }
      data.gsub!(/#{DivisionOperator} (\w+)/) { "* 1/#{$1}" }

      # COMPARISONS
      data.gsub!(/#{EqualTo} (\w+)/) { "== #{$1}" }
      data.gsub!(/#{GreaterThan} (\w+)/) { "> #{$1}" }
      data.gsub!(/#{Or} (\w+)/) { "|| #{$1}" }
      data.gsub!(/#{And} (\w+)/) { "&& #{$1}" }

      # HACKS :-D
      data.gsub!(/#{EndAssignVariable}/) { "" }
      data.gsub!(/#{NonVoidMethod}/) { "unused=0)" }
      data.gsub!(/#{Return} (\w+)/) { "return #{$1}" }
      data.gsub!(/#{Print} (.*)/) { "puts #{$1}" }

      # WRAPPING THE SH*T UP
      locs = data.split("\n").reject { |l| l.empty? } + ["main"]
      data = locs.map.with_index { |l,i| "L%04d: %s" % [i, l] }.join("\n")

      code = locs.join("\n")
      puts "arnoldc.rb..."
      puts data if $-w
      puts

      eval(code)

      puts "\nExiting."
      end

  end
end
