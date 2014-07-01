if platform?('debian')
  include_recipe 'apt'
end

package 'tar'

include_recipe 'toran::app'
include_recipe 'toran::cron'

log 'Support' do
  message <<EOF

+------------------------------------------------------------+
| Support Composer and get a license! https://toranproxy.com |
+------------------------------------------------------------+
EOF
  action :nothing
end

execute 'noop' do
  command 'true'
  notifies :write, 'log[Support]', :delayed
end