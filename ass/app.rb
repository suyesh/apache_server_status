require 'rubygems'
require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/json'
require 'nokogiri'
require 'open-uri'

get '/' do
    @servers = ARGV
    erb :index
end

get '/:server' do
    begin
             begin
                 url = "http://#{params[:server]}/server-status"
                 doc = Nokogiri::HTML(open(url))
             rescue
                 url = "https://#{params[:server]}/server-status"
                 doc = Nokogiri::HTML(open(url))
             end
             json(cpu: doc.css('dl')[1].children[15].text.split[7][0..-2],
                  load_average: doc.css('dl')[1].children[11].text.split[2],
                  requests_per_second: doc.css('dl')[1].children[17].text.split[0],
                  requests: doc.css('dl')[1].children[19].text.split[0],
                  idle_workers: doc.css('dl')[1].children[19].text.split[5],
                  size_per_request: doc.css('dl')[1].children[17].text.split[6],
                  size_title: doc.css('dl')[1].children[17].text.split[7])
    rescue
      json(cpu: "--/--",
           load_average: "--/--",
           requests_per_second: "--/--",
           requests: "--/--",
           idle_workers: "--/--",
           size_per_request: "--/--",
           size_title: "--/--")
    end
end
