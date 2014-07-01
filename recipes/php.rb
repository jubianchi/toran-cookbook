node.default[:php][:install_method] = 'source'
node.default[:php][:url] = 'http://fr.php.net/get'
node.default[:php][:directives] = {
    :'date.timezone' => 'Europe/Paris'
}

include_recipe 'php'

directory '/etc/php5/fpm/pool.d' do
  recursive true
end

template '/usr/local/etc/php-fpm.conf' do
  source 'php/fpm.conf'
end

template 'Toran Proxy php-fpm pool' do
  path "/etc/php5/fpm/pool.d/#{node[:toran][:app][:name]}.conf"
  source 'toran/php-fpm-pool.conf.erb'
end

execute 'Start php-fpm' do
  command 'php-fpm'
  not_if 'test -f /var/run/php5-fpm.pid'
end

execute 'Stop php-fpm' do
  command 'kill -15 $(cat /var/run/php5-fpm.pid)'
  only_if 'test -f /var/run/php5-fpm.pid'
  notifies :run, 'execute[Start php-fpm]', :delayed
end