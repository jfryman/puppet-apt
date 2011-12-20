class apt::package {
  package { $apt::params::at_packages:
    ensure => present,
  }
}
