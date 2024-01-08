class profile::personal::file {
  file { '/root/personal':
    ensure => file
  }
}
