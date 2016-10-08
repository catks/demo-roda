require_relative 'api_resource'
require 'json'

class Champion < ApiResource

  CHAMPION_IMAGE_CDN = "http://ddragon.leagueoflegends.com/cdn/6.19.1/img/champion/"

  define_resource "https://global.api.pvp.net/api/lol/static-data/br/v1.2/champion?champData=image&api_key=#{ENV['API_KEY']}"
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

  def self.parser(response)
    JSON.parse(response.body)['data'].map do |k,v|
      Champion.new(id: v['id'],name: v['name'],title: v['title'],image: v.dig('image','full'))
    end
  end

end
