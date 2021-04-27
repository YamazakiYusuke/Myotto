server '3.115.177.124', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '~/home/vagrant/.ssh/id_rsa'