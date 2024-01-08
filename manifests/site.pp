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
  file { '/root/personal':
    ensure => file
  }

  notify { "Running os ${facts['os']['name']} version ${facts['os']['release']['full']}": }

  class { 'dev_user':
    user_name => 'prod_user',
    password  => '$1$82O96PFM$8avkFBH/CitHmrE9rEtjb1'
  }
}
