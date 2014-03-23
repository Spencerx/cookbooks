
directory "/home/vagrant/git/" do
  action :create
end

git "/home/vagrant/git/jig" do
  repository "git://github.com/juxt/jig.git"
  action     :sync
end

git "/home/vagrant/git/azondi" do
  repository "git://github.com/opensensorsio/azondi.git"
  action     :sync
end
