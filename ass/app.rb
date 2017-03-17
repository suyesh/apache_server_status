require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'bundler/setup'
require 'nokogiri'
require 'open-uri'

url = 'http://dot55simsapp01.dot.nycnet/server-status'


get '/' do
  doc = Nokogiri::HTML(open(url))
  @cpu =  doc.css('dl')[1].children[15].text.split[7][0..-2]
  @load_average = doc.css('dl')[1].children[11].text.split[2]
  @requests_per_second = doc.css('dl')[1].children[17].text.split[0]
  @requests = doc.css('dl')[1].children[19].text.split[0]
  @idle_workers = doc.css('dl')[1].children[19].text.split[5]
  @size_per_request = doc.css('dl')[1].children[17].text.split[6]
  @size_title = doc.css('dl')[1].children[17].text.split[7]
  erb :index
end
