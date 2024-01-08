class profile::personal_file {
  file { '/root/personal':
    ensure => file
  }
}
