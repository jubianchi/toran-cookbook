cron 'Toran Proxy cron job' do
  command "cd #{node[:toran][:app][:directory]} && php bin/cron -v > app/logs/cron.log"
  user node[:toran][:app][:user]
  minute "*/5"
end