
Vagrant.configure(2) do |config|
   config.vm.box = "bento/centos-7.3"
  
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.hostname = "yevgen.local"

  
  config.vm.provider 'virtualbox' do |vb|
	vb.memory = "512"
  end
  
  config.vm.provision 'ansible_setup', type: 'shell', path: 'provision/ansible_setup.sh', keep_color: true
end
