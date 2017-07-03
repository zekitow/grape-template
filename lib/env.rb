require 'bundler'

Bundler.require
Bundler.require :production

Dir.glob('./lib/{apis}/*.rb').each { |file| require file }