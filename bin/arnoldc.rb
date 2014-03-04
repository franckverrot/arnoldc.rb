#!/usr/bin/env ruby
$:<< 'lib'
require 'parser'

parser = ArnoldC::Parser.new(ARGV[0])

puts "\narnoldc.rb..."

parser.execute($-w)

puts "\n\nExiting."
