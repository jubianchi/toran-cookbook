remote_file 'Download Toran Proxy release' do
  source "#{node[:toran][:package][:url]}/toran-proxy-#{node[:toran][:package][:version]}.tgz"
  path "#{Chef::Config[:file_cache_path]}/toran-proxy-#{node[:toran][:package][:version]}.tgz"
  notifies :run, 'execute[Decompress Toran Proxy release]', :immediately
end

execute 'Toran Proxy directory permissions' do
  command "chown -R #{node[:toran][:app][:user]}:#{node[:toran][:app][:group]} ."
  cwd node[:toran][:app][:directory]
  action :nothing
end

group node[:toran][:app][:group]
user 'Create Toran Proxy user' do
  username node[:toran][:app][:user]
  gid node[:toran][:app][:group]
  action :create
  notifies :run, 'execute[Toran Proxy directory permissions]', :delayed
end

execute 'Decompress Toran Proxy release' do
  command "tar xzvf toran-proxy-#{node[:toran][:package][:version]}.tgz"
  cwd Chef::Config[:file_cache_path]
  action :nothing
  notifies :create, 'ruby_block[Deploy Toran Proxy release]', :immediately
end

ruby_block 'Deploy Toran Proxy release' do
  block do
    FileUtils.mkdir_p node[:toran][:app][:directory]
    FileUtils.cp_r(Dir["#{Chef::Config[:file_cache_path]}/toran/*"], node[:toran][:app][:directory])
  end
  action :nothing
  notifies :create, 'template[Configure application]', :immediately
  notifies :create, 'template[Configure Toran Proxy]', :immediately
  notifies :create, 'template[Configure Toran Proxy Composer auth]', :immediately
  notifies :run, 'execute[Toran Proxy directory permissions]', :delayed
end

template 'Configure application' do
  source 'toran/parameters.yml.erb'
  path "#{node[:toran][:app][:directory]}/app/config/parameters.yml"
  action :nothing
  notifies :run, 'execute[Toran Proxy directory permissions]', :delayed
end

template 'Configure Toran Proxy' do
  source 'toran/config.yml.erb'
  path "#{node[:toran][:app][:directory]}/app/toran/config.yml"
  action :nothing
  notifies :run, 'execute[Toran Proxy directory permissions]', :delayed
end

template 'Configure Toran Proxy Composer auth' do
  source 'toran/composer-auth.json.erb'
  path "#{node[:toran][:app][:directory]}/app/toran/composer/auth.json"
  action :nothing
  notifies :run, 'execute[Toran Proxy directory permissions]', :delayed
end
