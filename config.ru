puts $LOAD_PATH
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV']

class API < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  get '/things' do
    (rand(10)+1).times.map{|i|"thing#{i}"}
  end
end

run API
