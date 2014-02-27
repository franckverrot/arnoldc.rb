#!/usr/bin/env ruby
# COMPUTE FILE NAME
filename = ARGV.fetch(0) { raise ArgumentError, 'You should provide a script name. eg: ./arnoldc.rb my_file.arnoldc' }

# READ FILE
data = File.read(filename)

# DROP LEADING SPACES
data.gsub!(/^\s*(.*)/) { $1 }

# MAIN PROGRAM
data.gsub!(/IT'S SHOWTIME/,"def main")
data.gsub!(/(HASTA LA VISTA, BABY|CHILL|YOU HAVE BEEN TERMINATED|YOU HAVE NO RESPECT FOR LOGIC)/,"end")

# MACROS
data.gsub!(/@NO PROBLEMO/,"true")
data.gsub!(/@I LIED/,"false")

# CONDITIONALS
data.gsub!(/BECAUSE I'M GOING TO SAY PLEASE (\w*)/) { "if #{$1}" }
data.gsub!(/BULLSHIT/,"else")

# LOOP
data.gsub!(/STICK AROUND (\w*)/) { "while #{$1}" }

# ASSIGNMENTS
data.gsub!(/HEY CHRISTMAS TREE (\w+)\nYOU SET US UP (\w*)/) { "#{$1} = #{$2}" }
data.gsub!(/GET TO THE CHOPPER (\w+)/) { "#{$1} = \\" }
data.gsub!(/GET YOUR ASS TO MARS (\w+)/) { "#{$1} = \\" }

# METHODS
data.gsub!(/LISTEN TO ME VERY CAREFULLY (\w+)/) { "def #{$1}(" }
data.gsub!(/I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE (\w+)/) { "#{$1}," }

# METHOD CALLS
data.gsub!(/DO IT NOW (\w*) (\w+) (\w+)/) { "#{$1}(#{$2}, #{$3})" }
data.gsub!(/HERE IS MY INVITATION (\w+)/) { "#{$1}\\" }

# ARITHMETICS
data.gsub!(/GET DOWN (\w+)/) { "- #{$1}" }
data.gsub!(/GET UP (\w+)/) { "+ #{$1}" }
data.gsub!(/YOU'RE FIRED (\w+)/) { "* #{$1}" }
data.gsub!(/HE HAD TO SPLIT (\w+)/) { "* 1/#{$1}" }

# COMPARISONS
data.gsub!(/YOU ARE NOT YOU YOU ARE ME (\w+)/) { "== #{$1}" }
data.gsub!(/LET OFF SOME STEAM BENNET (\w+)/) { "> #{$1}" }
data.gsub!(/CONSIDER THAT A DIVORCE (\w+)/) { "|| #{$1}" }
data.gsub!(/KNOCK KNOCK (\w+)/) { "&& #{$1}" }

# HACKS :-D
data.gsub!(/ENOUGH TALK/) { "" }
data.gsub!(/GIVE THESE PEOPLE AIR/) { "unused=0)" }
data.gsub!(/I'LL BE BACK (\w+)/) { "return #{$1}" }
data.gsub!(/TALK TO THE HAND (.*)/) { "puts #{$1}" }

# WRAPPING THE SH*T UP
locs = data.split("\n").reject { |l| l.empty? } + ["main"]
data = locs.map.with_index { |l,i| "L%04d: %s" % [i, l] }.join("\n")

code = locs.join("\n")
puts "arnoldc.rb..."
puts data if $-w
puts

eval(code)

puts "\nExiting."
