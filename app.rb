# -*- encoding: UTF-8 -*-
require 'rubygems'
require 'sinatra'
require 'haml'
require 'oauth2'

set :haml, {:format => :html5}
enable :sessions, :logging

set :auth_server,   'Auth service URI (ex. https://auth.example.com/)'
set :api_server,    'API service URI (ex. https://api.example.com/)'
set :client_id,     'OAuth 2.0 client ID for your application'
set :client_secret, 'OAuth 2.0 client secret for your application'

set :token do
  @token = nil if !@token.nil? && Time.now.to_i > @token[:expires_at].to_i
  @token ||= begin
    client = OAuth2::Client.new(client_id, client_secret, site: auth_server, token_url: '/token')
    client.client_credentials.get_token.to_hash
  end
  @token.dup
end

get '/' do
  haml :index
end

post '/api' do
  api_response = nil
  api_error    = nil
  begin
    # Content-Type requires no "charset" parameter in rfc7159.
    # But google chrome requires "charset" parameter.
    content_type 'application/json; charset=utf-8'
    method = params[:method].to_sym
    path   = params[:path]
    query  = Rack::Utils.parse_nested_query(params[:parameters])
    client = OAuth2::Client.new(settings.client_id, settings.client_secret, site: settings.api_server )
    OAuth2::AccessToken.from_hash(client, settings.token).request(method, path, params: query).body
  rescue => e
    content_type :html
    haml :api, locals: {api_error: e}
  end
end
