require_relative '../models/champion.rb'
require_relative '../models/item.rb'
#Dir[(Dir.pwd + "/models/shared_examples/**/*.rb")].each {|f| require f}
Dir["./spec/models/shared_examples/*.rb"].sort.each { |f| require f}
