require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'bundler/setup'
require 'nokogiri'


get '/' do
  erb :index
end
