require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/json'
require 'bundler/setup'
require 'nokogiri'
require 'open-uri'

helpers do
  def partial(page, options={})
    erb page.to_sym, options.merge!(:layout => false)
  end
end

def set_server(server)
    if server == 'app01'
        'http://dot55simsapp01.dot.nycnet/server-status'
    elsif server == 'app02'
        'http://dot55simsapp02.dot.nycnet/server-status'
    else
        'https://simstcdstg.net/server-status'
    end
end

get '/' do
    @current_app = 'SimsTcd'
    erb :index
end

get '/app01' do
    @current_app = 'APP01'
    erb :app01
end

get '/app02' do
    @current_app = 'APP02'
    erb :app02
end

get '/stat/:server' do
    url = set_server(params[:server])
    @current_app = params[:server].upcase
    doc = Nokogiri::HTML(open(url))
    json(cpu: doc.css('dl')[1].children[15].text.split[7][0..-2],
         load_average: doc.css('dl')[1].children[11].text.split[2],
         requests_per_second: doc.css('dl')[1].children[17].text.split[0],
         requests: doc.css('dl')[1].children[19].text.split[0],
         idle_workers: doc.css('dl')[1].children[19].text.split[5],
         size_per_request: doc.css('dl')[1].children[17].text.split[6],
         size_title: doc.css('dl')[1].children[17].text.split[7])
end
