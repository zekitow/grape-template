$:.unshift File.expand_path '..', __FILE__

require './app/env'
require './app/app'

run APIs::App