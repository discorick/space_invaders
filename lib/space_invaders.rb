require 'gosu'
Dir[File.dirname(__FILE__) + '**/**/*.rb'].each{|file| require file}
Dir[File.dirname(__FILE__) + '**/**/**/*.rb'].each{|file| require file}
Dir[File.dirname(__FILE__) + 'resources/*.rb'].each{|file| require file}
