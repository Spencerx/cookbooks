directory "/home/vagrant/git/" do
  action :create

  owner  node.jig.user
  group  node.jig.user
end

git "/home/vagrant/git/jig" do
  repository node.jig.clone_url
  action     :sync

  user       node.jig.user
  group      node.jig.user
end
