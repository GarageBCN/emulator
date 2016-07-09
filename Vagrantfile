Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/ubuntu1604"
  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.customize ["modifyvm", :id, "--memory", 1024]
  end
  config.vm.network "forwarded_port", guest:5900, host:5900
  config.vm.network "forwarded_port", guest:2222, host:2223
  config.vm.provision "ansible_local" do |ansible|
    ansible.install_mode = :pip
    ansible.playbook = "setup.yml"
  end
  config.vm.define "robota" do |robota| 
    robota.vm.hostname = "robota"
    robota.vm.provider "virtualbox" do |v|
      v.name = "robota"
    end
  end
end
