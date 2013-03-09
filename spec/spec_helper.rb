require 'rspec'
require 'fakes-rspec'
require 'fakes'
require_relative '../lib/space_invaders.rb'

Dir.glob('lib/core/*/*.rb').each do |item|
  full_path = File.expand_path(item)
  require full_path
end



