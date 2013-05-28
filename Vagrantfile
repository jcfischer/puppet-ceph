# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Uncomment this if using Vagrant 1.0.x
#
#Vagrant.configure("1") do |config|
#  # Vagrant 1.0.x config
#  config.vm.box = "raring64"
#  config.vm.box_url = "https://www.dropbox.com/s/wc5k9l48l1r18aq/raring64_v1.box"
#
#  config.vm.customize ["modifyvm", :id, "--nictype1", "virtio"]
#  config.vm.customize ["modifyvm", :id, "--macaddress1", "auto"]
#
#  (0..2).each do |i|
#    config.vm.define "mon#{i}" do |mon|
#      mon.vm.host_name = "ceph-mon#{i}.test"
#      mon.vm.network :hostonly, "192.168.251.1#{i}", { :nic_type => 'virtio' }
#      mon.vm.network :hostonly, "192.168.252.1#{i}", { :nic_type => 'virtio' }
#      mon.vm.provision :shell, :path => "examples/mon.sh"
#    end
#  end
#
#  (0..2).each do |i|
#    config.vm.define "osd#{i}" do |osd|
#      osd.vm.host_name = "ceph-osd#{i}.test"
#      osd.vm.network :hostonly, "192.168.251.10#{i}", { :nic_type => 'virtio' }
#      osd.vm.network :hostonly, "192.168.252.10#{i}", { :nic_type => 'virtio' }
#      osd.vm.provision :shell, :path => "examples/osd.sh"
#      (0..1).each do |d|
#        osd.vm.customize [ "createhd", "--filename", "disk-#{i}-#{d}", "--size", "5000" ]
#        osd.vm.customize [ "storageattach", :id, "--storagectl", "SATAController", "--port", 3+d, "--device", 0, "--type", "hdd", "--medium", "disk-#{i}-#{d}.vdi" ]
#      end
#    end
#  end
#
#  (0..1).each do |i|
#    config.vm.define "mds#{i}" do |mds|
#      mds.vm.host_name = "ceph-mds#{i}.test"
#      mds.vm.network :hostonly, "192.168.251.15#{i}", { :nic_type => 'virtio' }
#      mds.vm.provision :shell, :path => "examples/mds.sh"
#    end
#  end
#end

#
# Comment this if using Vagrant 1.0.x
#
Vagrant.configure("2") do |config|
  # Vagrant >1.1 config
  config.vm.box = "raring64"
  #config.vm.box_url = "https://www.dropbox.com/s/kloqerzoetl1fyy/raring64_v2.box"
  config.vm.box_url = "https://www.dropbox.com/s/wc5k9l48l1r18aq/raring64_v1.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--macaddress1", "auto"]
  end

  (0..0).each do |i|
    config.vm.define "mon#{i}" do |mon|
      mon.vm.hostname = "ceph-mon#{i}.test"
      mon.vm.network :private_network, ip: "192.168.251.1#{i}"
      mon.vm.network :private_network, ip: "192.168.252.1#{i}"
      mon.vm.provision :shell, :path => "examples/mon.sh"
    end
  end

  (0..1).each do |i|
    config.vm.define "osd#{i}" do |osd|
      osd.vm.hostname = "ceph-osd#{i}.test"
      osd.vm.network :private_network, ip: "192.168.251.10#{i}"
      osd.vm.network :private_network, ip: "192.168.252.10#{i}"
      osd.vm.provision :shell, :path => "examples/osd.sh"
      (0..1).each do |d|
        osd.vm.customize [ "createhd", "--filename", "disk-#{i}-#{d}", "--size", "5000" ]
        osd.vm.customize [ "storageattach", :id, "--storagectl", "SATAController", "--port", 3+d, "--device", 0, "--type", "hdd", "--medium", "disk-#{i}-#{d}.vdi" ]
      end
    end
  end

  (0..0).each do |i|
    config.vm.define "mds#{i}" do |mds|
      mds.vm.hostname = "ceph-mds#{i}.test"
      mds.vm.network :private_network, ip: "192.168.251.15#{i}"
      mds.vm.provision :shell, :path => "examples/mds.sh"
    end
  end
end