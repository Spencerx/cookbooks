home = "/home/vagrant"

directory "#{home}/git/" do
  action :create

  owner  node.jig.user
  group  node.jig.user
end

git "#{home}/git/jig" do
  repository node.jig.clone_url
  action     :sync

  user       node.jig.user
  group      node.jig.user
end

directory "#{home}/.jig/" do
  action :create

  owner  node.jig.user
  group  node.jig.user
end

template "#{home}/.jig/config.edn" do
  source  "jig_config.edn.erb"
  variables included_configs: node.jig.included_configs

  owner  node.jig.user
  group  node.jig.user
end
