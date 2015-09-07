# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/precise64"

  config.vm.network :private_network, ip: "192.168.66.2"

  config.vm.provider "hyperv" do |v|
    v.memory = 2048
    v.cpus = 4
  end

  HOME = ENV['HOME']
  config.vm.provision :shell, :path => "provision/hostname.sh"
  config.vm.provision :shell, :path => "provision/apt.sh"
  config.vm.provision :shell, :path => "provision/ruby.sh"
  config.vm.provision :shell, :path => "provision/docker.sh"
  config.vm.provision :shell, :path => "provision/packages.sh"

end
