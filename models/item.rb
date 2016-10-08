require_relative 'api_resource'

class Item < ApiResource
  define_resource "https://global.api.pvp.net/api/lol/static-data/br/v1.2/item?api_key=#{ENV['API_KEY']}"
  attr_reader :id,:name,:plaintext,:description

  def initialize(id:,name:,plaintext:,description:)
    @id = id
    @name = name
    @plaintext = plaintext
    @description = description
  end


  def self.parser(response)
    JSON.parse(response.body)['data'].map do |k,v|
      Item.new(id: v['id'],name: v['name'],description: v['description'],plaintext: v['plaintext'])
    end
  end

end
