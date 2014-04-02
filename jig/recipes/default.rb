home = "/home/vagrant"

directory "#{home}/git/" do
  action :create

  owner  node.jig.user
  group  node.jig.user
end

git "#{home}/git/jig" do
  repository node.jig.clone_url
  revision   node.jig.revision
  action     :sync

  user       node.jig.user
  group      node.jig.user

  notifies :run, resources(:bash => "jig.sub.install"), :immediately
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

bash "jig.sub.install" do
  command "cd #{home}/git/jig; lein sub install"
  action  :nothing
end
