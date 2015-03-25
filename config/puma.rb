root = File.expand_path('../../', __FILE__)
#bind "unix://#{root}/tmp/puma.sock"
port 9292
pidfile "#{root}/tmp/puma.pid"
stdout_redirect "#{root}/logs/puma.log", "#{root}/logs/puma_err.log", true
state_path "#{root}/tmp/puma.state"
activate_control_app

