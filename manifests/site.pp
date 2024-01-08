class dev_user (
  $user_name = 'demo_user',
  $password  = '$1$Gdi1eg83$lCTP35NrycMk.MO7WQ5Ut1'
) {
  user { $user_name:
    ensure => present,
    managehome => true,
    groups => ['wheel'],
    password => $password,
  }
}

node default{
  file { '/root/README':
    ensure => file,
    content => 'Hello, world!'
  }
}

node slave1.puppet {
  Package { ensure => 'installed' }
  package {'screen':}
  package {'vim':}

  include dev_user
}

node slave2.puppet {
  file { '/root/personal':
    ensure => file
  }

  notify { "Running os ${facts['os']['name']} version ${facts['os']['release']['full']}": }
}
