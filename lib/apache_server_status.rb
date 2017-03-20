require "apache_server_status/version"
require 'rubygems'
require 'sinatra'
require 'sinatra/json'
require 'nokogiri'
require 'open-uri'

class Ass < Sinatra::Application
    get '/' do
        @servers = ARGV
        erb :index
    end

    get '/:server' do
        begin
              begin
                  url = "http://#{params[:server]}/server-status"
                  doc = Nokogiri::HTML(open(url))
                  json(cpu: doc.css('dl')[1].children[15].text.split[7][0..-2],
                       load_average1: doc.css('dl')[1].children[11].text.split[2],
                       load_average2: doc.css('dl')[1].children[11].text.split[3],
                       load_average3: doc.css('dl')[1].children[11].text.split[4],
                       requests_per_second: doc.css('dl')[1].children[17].text.split[0],
                       requests: doc.css('dl')[1].children[19].text.split[0],
                       idle_workers: doc.css('dl')[1].children[19].text.split[5],
                       size_per_request: doc.css('dl')[1].children[17].text.split[6],
                       size_title: doc.css('dl')[1].children[17].text.split[7])
              rescue
                  url = "https://#{params[:server]}/server-status"
                  doc = Nokogiri::HTML(open(url))
                  json(cpu: doc.css('dl')[1].children[15].text.split[7][0..-2],
                       load_average1: doc.css('dl')[1].children[11].text.split[2],
                       load_average2: doc.css('dl')[1].children[11].text.split[3],
                       load_average3: doc.css('dl')[1].children[11].text.split[4],
                       requests_per_second: doc.css('dl')[1].children[17].text.split[0],
                       requests: doc.css('dl')[1].children[19].text.split[0],
                       idle_workers: doc.css('dl')[1].children[19].text.split[5],
                       size_per_request: doc.css('dl')[1].children[17].text.split[6],
                       size_title: doc.css('dl')[1].children[17].text.split[7])
              end
          rescue
              json(cpu: '--/--',
                   load_average1: '--/--',
                   load_average2: '--/--',
                   load_average3: '--/--',
                   requests_per_second: '--/--',
                   requests: '--/--',
                   idle_workers: '--/--',
                   size_per_request: '--/--',
                   size_title: '--/--')
          end
    end
end
