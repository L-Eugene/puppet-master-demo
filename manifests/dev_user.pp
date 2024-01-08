class dev_user (
  String $user_name = 'demo_user',
  String $password  = '$1$Gdi1eg83$lCTP35NrycMk.MO7WQ5Ut1',
  Array $groups = ['wheel', 'adm', 'developers']
) {
  group { $groups:}

  user { $user_name:
    ensure => present,
    managehome => true,
    groups => $groups,
    password => $password,
  }
}
