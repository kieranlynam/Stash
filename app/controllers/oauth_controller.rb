require 'net/http'
require 'faraday'
require 'pry'
require 'pry-nav'

class OauthController < ApplicationController
 skip_before_filter :verify_authenticity_token  

   def callback

        code = params[:code]
        state = params[:state]

        puts code
        puts '******************************'

        conn = Faraday.new(:url => 'https://api.monzo.com') do |faraday|
            faraday.request  :url_encoded             # form-encode POST params
            faraday.response :logger                  # log requests to STDOUT
            faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end

        res = conn.post '/oauth2/token', { 
            :grant_type => 'authorization_code', 
            :client_id =>  'oauthclient_00009EVlFZwDqu9nSSq0m1', 
            :client_secret => 'v3l/ViweZLCKl3MFSEk3jDHjgijXzgfbUtDaUhfnIN98AbFXvOksG2At/hCGYwGdLMa70hg1eDsLXNn/JMUX',
            :redirect_uri => 'http://localhost:3000/oauth/callback', 
            :code => code 
        }

        puts res

   end

end