vsn = "2.3.4"

default[:leiningen] = {
  :version        => vsn,
  :install_script => "https://raw.github.com/technomancy/leiningen/#{vsn}/bin/lein"
}
