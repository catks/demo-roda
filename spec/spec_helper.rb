require_relative '../app.rb'
require_relative '../models/champion.rb'
require_relative '../models/item.rb'
Dir["./spec/models/shared_examples/*.rb"].sort.each { |f| require f}
Dir["./spec/integration/shared_examples/*.rb"].sort.each { |f| require f}


