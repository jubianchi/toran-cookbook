include_recipe 'apt'

apt_repository 'non-free' do
  uri 'http://http.debian.net/debian/'
  distribution node[:lsb][:codename]
  components %w(main contrib non-free)
  notifies :run, 'execute[apt-get update]', :immediately
end

include_recipe 'apache2'
include_recipe 'apache2::mod_fastcgi'
include_recipe 'apache2::mod_actions'

template '/etc/apache2/mods-available/fastcgi.conf' do
  source 'apache2/fastcgi.conf'
  notifies :restart, 'service[apache2]', :delayed
end

web_app node[:toran][:app][:name] do
  template 'toran/apache2-vhost.conf.erb'
  enable true
  notifies :restart, 'service[apache2]', :delayed
end

directory "#{node[:toran][:app][:directory]}/cgi-bin" do
  recursive true
end