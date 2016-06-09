require 'sinatra/base'
require_relative 'lib/nesting_helper'

class App < Sinatra::Base
  include NestingHelper

  get '/' do
    erb(:test)
  end

  get '/test' do
    nest(:test, :layout2, :layout)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
