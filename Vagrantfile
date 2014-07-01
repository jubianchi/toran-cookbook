Vagrant.configure('2') do |config|
  #VMs
  config.vm.hostname = 'toran'
  config.vm.network 'private_network', ip: '192.168.50.4'

  config.vm.define :debian do |debian|
    debian.vm.box = 'jubianchi/debian-wheezy-chef-amd64'
  end

  config.vm.define :centos do |centos|
    centos.vm.box = 'jubianchi/centos-65-chef-amd64'
  end

  #Omnibus
  config.omnibus.chef_version = :latest

  #Berkshelf
  config.berkshelf.berksfile_path = './Berksfile'
  config.berkshelf.enabled = true

  #Host Manager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  #Chef
  config.vm.provision :chef_solo do |chef|
    #chef.log_level = :debug

    chef.run_list = %w(
        recipe[toran]
        recipe[toran::php]
        recipe[toran::apache2]
    )

    chef.json = {
        #:toran => {
        #    :composer => {
        #        :auth => {
        #            :github => 'your-github-token'
        #        }
        #    }
        #}
    }
  end
end