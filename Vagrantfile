# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Vagrant >1.1 config
  config.vm.box = "raring64"
  #config.vm.box_url = "https://www.dropbox.com/s/kloqerzoetl1fyy/raring64_v2.box"
  #config.vm.box_url = "https://www.dropbox.com/s/wc5k9l48l1r18aq/raring64_v1.box"

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
        #osd.vm.customize [ "createhd", "--filename", "disk-#{i}-#{d}", "--size", "5000" ]
        #osd.vm.vmx[""] =
        #osd.vm.customize [ "storageattach", :id, "--storagectl", "SATAController", "--port", 3+d, "--device", 0, "--type", "hdd", "--medium", "disk-#{i}-#{d}.vdi" ]
        #osd.vm.vmx["scsi0:1.present"] = "TRUE"
        #osd.vm.vmx["scsi0:1.fileName"] = "disk-#{i}-#{d}.vmdk"
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
