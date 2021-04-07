Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu/xenial64'

  config.vm.hostname = 'my-app'

  config.vm.network :private_network, ip: '192.168.50.10'
  config.vm.network "forwarded_port", guest: 8080, host: 80, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 3000, host: 30, host_ip: "127.0.0.1"
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.cpus = 4
    vb.memory = 8192
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'off']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'off']
  end

  config.disksize.size = '30GB'
  config.mutagen.orchestrate = true

  config.vm.synced_folder './', '/home/vagrant/app', type: "rsync",
    rsync_auto: true,
    rsync__exclude: ['.git/', 'node_modules/', 'log/', 'tmp/']

  config.vm.provision 'shell', inline: <<-SHELL
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker vagrant

    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
  SHELL
end
# 参考: https://qiita.com/yuki_ycino/items/cb21cf91a39ddd61f484
