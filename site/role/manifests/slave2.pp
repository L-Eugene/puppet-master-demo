class role::slave2 {
  include profile::personal::file

  notify { "Running os ${facts['os']['name']} version ${facts['os']['release']['full']}": }

  class {'profile::dev_user':
    user_name => 'prod_user',
    password  => '$1$82O96PFM$8avkFBH/CitHmrE9rEtjb1'
  }
}
