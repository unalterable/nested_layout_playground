require 'sinatra/base'
require_relative 'lib/nesting_helper'

class App < Sinatra::Base
  

  get '/' do
    erb(:test)
  end

  get '/test' do
    NestingHelper.new.nest([:test, :layout1, :layout1, :layout2, :layout3, :layout1, :layout2, :layout3])
  end
  
  get '/test2' do
    NestingHelper.new.nest([:test, :layout1])
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
