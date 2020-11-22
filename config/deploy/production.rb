server '18.177.13.105', user: 'shogo', roles: %w{app db web}

set :ssh_options, keys: '~/.ssh/id_rsa'
