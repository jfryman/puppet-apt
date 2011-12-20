module Puppet::Parser::Functions
  newfunction(:expand_ppa_line, :type => :rvalue) do |args|
    distro_codename = args[1]
    abrev = args[0].split(":")[1]
    ppa_owner = abrev.split("/")[0].gsub(/[^a-zA-Z0-9_-]/, '_')
    ppa_name = abrev.split("/")[1] ? abrev.split("/")[1].gsub(/[^a-zA-Z0-9_-]/, '_') : nil
    sourceslistd = %x[/usr/bin/apt-config dump | grep Dir::Etc::sourceparts].split(" ")[1].gsub(/[^a-zA-Z.]/, '')
    filename =  "/etc/apt/#{sourceslistd}/#{ppa_owner}-#{ppa_name}-#{distro_codename}.list"
    return filename
  end
end
