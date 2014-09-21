# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "terrywang/archlinux"

  config.vm.provider "virtualbox" do |vb|
    vb.customize "pre-boot", ['modifyvm', :id, '--cpus', '2']
    vb.customize "pre-boot", ['modifyvm', :id, '--memory', '4096', '--ioapic', 'on']
    vb.customize "pre-boot", ['modifyvm', :id, '--uart1', '0x3F8', '4']
    vb.customize "pre-boot", ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize "pre-boot", ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  HOME = ENV['HOME']
  config.vm.synced_folder HOME, HOME

  config.persistent_storage.enabled = true
  config.persistent_storage.location = File.expand_path("../var-lib-docker.vmdk", __FILE__)
  config.persistent_storage.size = 40000
  config.persistent_storage.mountname = 'docker'
  config.persistent_storage.filesystem = 'ext4'
  config.persistent_storage.mountpoint = '/var/lib/docker'

  config.vm.provision :shell, :path => "provision/grub.sh"
  config.vm.provision :shell, :path => "provision/hostname.sh"
  config.vm.provision :shell, :path => "provision/pacman.sh"
  config.vm.provision :shell, :path => "provision/docker.sh"
  config.vm.network :private_network, ip: "192.168.111.222"
end
