name              "java"
maintainer        "Travis CI Team, OpenSensors Team"
maintainer_email  "michael@opensensors.io"
license           "Apache 2.0"
description       "Installs different Java Development Kits (JDK)"
version           "2.0.0"

supports 'ubuntu', '>= 12.04'

%w{ apt timezone }.each do |cb|
  depends cb
end

recipe "java::default", "Installs a default JDK"
