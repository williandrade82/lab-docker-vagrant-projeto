#Lista de nodes para executar o docker-swarm
machines = {
  "master" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04", "script" => "install-master.sh", "fix-ip" => "192.168.1.210"},
  "nodesw01" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04", "script" => "install-node.sh", "fix-ip" => "192.168.1.200"},
  "nodesw02" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04", "script" => "install-node.sh", "fix-ip" => "192.168.1.201"},
  "nodesw03" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04", "script" => "install-node.sh", "fix-ip" => "192.168.1.202"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "public_network", ip: "#{conf["fix-ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        
      end
      machine.vm.provision "shell", path: "install-docker.sh"
      machine.vm.provision "shell", path: "#{conf["script"]}" 
    end
  end
end
