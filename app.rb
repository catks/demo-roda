require 'roda'
require_relative 'env'
class App < Roda

  plugin :render,:engine=>'haml'
  plugin :assets,
         js: %w{app.js vendor/jquery-2.1.1.min.js vendor/materialize.js},
         css: %w{style.css vendor/materialize.css}

  route do |r|
    r.assets
    r.root {r.redirect '/index'}

    r.on 'index' do
      @champions = Champion.all

      r.get do
        view('index')
      end

    end

    r.on 'champion' do
      r.is ":id" do |id|
        @champion = Champion.find_by(id: id.to_i)
        view('champion')
      end
    end

  end

end
