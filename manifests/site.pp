node default{
  file { '/root/README':
    ensure => file,
    content => 'Hello, world!'
  }
}

node slave1.puppet {
  include role::slave1
}

node slave2.puppet {
  include role::slave2
}
