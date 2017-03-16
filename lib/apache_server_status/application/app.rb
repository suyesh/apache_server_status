require 'sinatra'
require 'apache_server_status'

class Ass < Sinatra::Base
    set :static, true
    set :public, File.expand_path('..', __FILE__)

    set :views,  File.expand_path('../views', __FILE__)

    get '/' do
        haml :'/index'
    end
end
