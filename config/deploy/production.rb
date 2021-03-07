server '54.95.98.16', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/vagrant/.ssh/id_rsa'