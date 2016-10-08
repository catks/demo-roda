require_relative 'api_resource'
require 'json'
require_relative 'item.rb'

class Champion < ApiResource

  CHAMPION_IMAGE_CDN = "http://ddragon.leagueoflegends.com/cdn/6.19.1/img/champion/"

  define_resource "https://global.api.pvp.net/api/lol/static-data/br/v1.2/champion?champData=image,recommended&api_key=#{ENV['API_KEY']}"
  attr_reader :id,:name,:title,:image,:recommended

  def initialize(id:,name:,title:,image:,recommend_hash:nil)
    @id = id
    @name = name
    @title = title
    @image = image
    @recommend_hash = recommend_hash
    set_recommend_methods if @recommend_hash
  end

  def image_url
    CHAMPION_IMAGE_CDN + @image
  end

  def load_items_for(mode)
    items_for(mode).map do |item|
      Item.find_by(id: item['id'])
    end.flatten
  end

  def self.parser(response)
    JSON.parse(response.body)['data'].map do |k,v|

      recommendations = parse_champion_recommendations(v['recommended'])

      Champion.new(id: v['id'],name: v['name'],title: v['title'],image: v.dig('image','full'),recommend_hash: recommendations)
    end
  end

  private

  def self.parse_champion_recommendations(recommended_hash)
    recommended_hash.map{|r| Hash[r["mode"],r['blocks'].map{|t| t["items"]}] }
  end

  def set_recommend_methods
    #Returns A Array of modes for each champion
    define_singleton_method(:modes){ @recommend_hash.map{|h| h.keys.first } }

    #Return a Array of Hashes with id and count of items
    define_singleton_method(:items_for)do |mode|
      @recommend_hash.select{|r| r.keys.first == mode}.first.values.flatten
    end

  end
end
