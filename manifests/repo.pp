define apt::repo(
  $ensure     = 'present',
  $type       = 'deb',
  $components = UNDEF,
  $distribution,
  $uri
) {
  include apt

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "/etc/apt/sources.list.d/${name}.list":
    ensure  => $ensure,
    content => "${type} ${uri} ${distribution} ${components}",
    notify  => Exec['apt-get update'],
  }
}
