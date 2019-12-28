set :branch, 'master'
set :server_address, '159.203.80.117'

ask(:password, nil, echo: false)
server fetch(:server_address), user: "root", roles: %w{app db web}

set :nginx_server_name, fetch(:server_address)
set :puma_preload_app, true