

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  
  # via 127.0.0.1 to disable public access
  config.vm.network "forwarded_port", guest: 3389, host: 3389, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|

    vb.memory = "4096"
    vb.cpus = "2"
  end
  
  config.vm.provision "shell", path: "script.sh"
  
  config.vm.provision "shell" do |s|
    s.privileged = true
    s.inline = "echo reboot is happening"
    s.reboot = true
  end

end
