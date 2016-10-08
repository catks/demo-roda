require 'rest-client'
require 'json'
class Champion
  API_CHAMPIONS = "https://global.api.pvp.net/api/lol/static-data/br/v1.2/champion?champData=image&api_key=#{ENV['API_KEY']}"
  CHAMPION_IMAGE_CDN = "http://ddragon.leagueoflegends.com/cdn/6.19.1/img/champion/"
  extend Enumerable

  attr_reader :id,:name,:title,:image

  def initialize(id:,name:,title:,image:)
    @id = id
    @name = name
    @title = title
    @image = image
  end

  def image_url
    CHAMPION_IMAGE_CDN + @image
  end

  #Class Methods
  class << self
    def all
      parser(response)
    end

    def each(&block)
      all.each(&block)
    end

    def sample
      all.sample
    end

    def fetch_champions
      @@response = RestClient.get(API_CHAMPIONS)
    end

    def response
      @@response ||= fetch_champions
    end

    private
    def parser(response)
      JSON.parse(response.body)['data'].map do |k,v|
        Champion.new(id: v['id'],name: v['name'],title: v['title'],image: v.dig('image','full'))
      end
    end
  end

end
