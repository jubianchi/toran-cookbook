default[:toran][:package][:url] = 'https://toranproxy.com/releases'
default[:toran][:package][:version] = 'v1.1.1'

default[:toran][:app][:name] = 'toran'
default[:toran][:app][:user] = 'toran'
default[:toran][:app][:group] = 'toran'
default[:toran][:app][:directory] = "/var/www/#{node[:toran][:app][:name]}"

default[:toran][:app][:config][:repositories] = {}
default[:toran][:app][:config][:packagist_packages] = {}
default[:toran][:app][:config][:packagist_sync] = 'proxy'
default[:toran][:app][:config][:dist_sync_mode] = 'lazy'
default[:toran][:app][:config][:git_prefix] = false
default[:toran][:app][:config][:git_path] = false
default[:toran][:app][:config][:license] = nil
default[:toran][:app][:config][:license_personal] = true

default[:toran][:composer][:auth][:github] = nil
