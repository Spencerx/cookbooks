home = "/home/vagrant"

directory "#{home}/git/" do
  action :create

  owner  node.azondi.user
  group  node.azondi.user
end

git "#{home}/git/azondi" do
  repository node.azondi.clone_url
  action     :sync

  user       node.azondi.user
  group      node.azondi.user
end

if node.jig
  node.default.jig.included_configs << "#{home}/git/azondi/configs/dev/core.edn"
end
