server '18.177.13.105', user: 'shogo',
                        roles: %w{app db web},
                        ssh_options: {
                        keys: [File.expand_path('~/.ssh/myapp_key_rsa)')]
                        }
