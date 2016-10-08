require 'rest-client'
require 'json'
class Champion
  API_CHAMPIONS = "https://global.api.pvp.net/api/lol/static-data/br/v1.2/champion?api_key=#{ENV['API_KEY']}"
  attr_reader :id,:name,:title

  def initialize(id:,name:,title:)
    @id = id
    @name = name
    @title = title
  end

  def self.all
    response = fetch_champions
    parser(response)
  end

  def self.fetch_champions
    RestClient.get(API_CHAMPIONS)
  end

  private

  def self.parser(response)
    JSON.parse(response.body)['data'].map do |k,v|
      Champion.new(id: v['id'],name: v['name'],title: v['title'])
    end
  end
end
