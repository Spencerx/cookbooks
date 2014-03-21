vsn = "2.3.4"

default[:leiningen] = {
  :version        => vsn,
  :install_script => "https://github.com/technomancy/leiningen/raw/#{vsn}/bin/lein"
}
