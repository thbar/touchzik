require 'sinatra'
require 'sass'
require 'coffee_script'

class TouchZik < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/application.js' do
    coffee :app
  end

  get '/stylesheet.css' do
    scss :stylesheet, :style => :expanded
  end
end
