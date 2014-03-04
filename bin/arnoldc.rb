#!/usr/bin/env ruby
$:<< 'lib'
require 'parser'

parser = ArnoldC::Parser.new(ARGV[0])
parser.execute
