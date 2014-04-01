#
# Cookbook Name:: ssh_keys
# Recipe:: default
#
# Author:: Michael Klishin (<michael@opensensors.io>)
#
# Copyright 2014, OpenSensors Development Team <team@opensensors.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.fetch(:private_ssh_keys, {}).each do |user, bag|
  # e.g. {"dir"=>"/home/vagrant", "gid"=>1000, "uid"=>1000, "shell"=>"/bin/bash", "gecos"=>""}
  user_info   = node.etc.passwd[user]
  item        = data_bag_item("ssh_keys", bag)
  ssh_dir     = File.join(user_info.dir, ".ssh")

  directory ssh_dir do
    owner  user_info.uid
    group  user_info.gid || user_info.uid
    mode   "0700"
    action :create
  end

  file File.join(ssh_dir, "id_rsa") do
    content item['private_key']

    owner  user_info.uid
    group  user_info.gid || user_info.uid
    mode   "0600"
  end

  file File.join(ssh_dir, "id_rsa.pub") do
    content item['public_key']

    owner  user_info.uid
    group  user_info.gid || user_info.uid
    mode   "0600"
  end
end
