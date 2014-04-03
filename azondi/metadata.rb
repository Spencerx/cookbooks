maintainer        "OpenSensors Team"
maintainer_email  "michael@opensensors.io"
license           "Apache 2.0"
description       "Provisions Azondi, part of the OpenSensors project"
version           "2.0.0"

supports 'ubuntu', '>= 12.04'

%w{ git leiningen sysctl }.each do |cb|
  depends cb
end

recipe "azondi::default", "Provisions Azondi from source"
