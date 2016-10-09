require 'rest-client'

class ApiResource
  extend Enumerable
  class << self
    def define_resource(resource)
      self.define_singleton_method(:api_resource){resource}
    end

    def all
      parser(response)
    end

    def each(&block)
      all.each(&block)
    end

    def find_by(**params)
      params.map { |k,v| find{ |r| r.send(k) == v } }.first
    end

    def sample
      all.sample
    end

    def fetch_champions
      @response = RestClient.get(api_resource)
    end

    def response
      @response ||= fetch_champions
    end

    def api_resource
      raise NotImplementedError,'Please define the resource in the subclass. example: define_resource "myawesomeurl.com/api/cats")'
    end

    private
    def parser(response)
      raise NotImplementedError,'Please implemment parser class method in the subclass'
    end
  end
end
