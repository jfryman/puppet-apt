class apt {
  include apt::params
  include apt::helpers

  anchor { 'apt::begin': }
  -> class { 'apt::package': }
  -> anchor { 'apt::end': }
}
