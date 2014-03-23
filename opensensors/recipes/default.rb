
directory "/home/vagrant/git/" do
  action :create

  owner  node.opensensors.user
  group  node.opensensors.user
end

git "/home/vagrant/git/jig" do
  repository "git://github.com/juxt/jig.git"
  action     :sync

  user       node.opensensors.user
end

git "/home/vagrant/git/azondi" do
  repository "git://github.com/opensensorsio/azondi.git"
  action     :sync

  user       node.opensensors.user
end
