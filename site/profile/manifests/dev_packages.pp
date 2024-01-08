class profile::dev_packages {
  Package { ensure => 'installed' }
  package {'screen':}
  package {'vim':}
}
