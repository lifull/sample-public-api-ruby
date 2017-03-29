# LIFULL HOME'S Public API Demo Ruby
This application is designed to demo the LIFULL HOME'S Public API.

## Installation

Clone this repository:

    git clone https://github.com/next-group/sample-public-api-ruby.git

Install dependency gems:

    bundle install

Or install it relative path:

    bundle install --path vendor/bundle

Configure client settings in app.rb (provided by LIFULL HOME'S):

    set :auth_server,   'Auth service URI (ex. https://auth.example.com/)'
    set :api_server,    'API service URI (ex. https://api.example.com/)'
    set :client_id,     'OAuth 2.0 client ID for your application'
    set :client_secret, 'OAuth 2.0 client secret for your application'

Run application with puma:

    bundle exec puma -C config/puma.rb

If you have any problems or requests please contact us.
