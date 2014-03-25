
directory "/home/vagrant/git/" do
  action :create

  owner  node.azondi.user
  group  node.azondi.user
end

git "/home/vagrant/git/azondi" do
  repository node.azondi.clone_url
  action     :sync

  user       node.azondi.user
  group      node.azondi.user
end
