class wcg {
  package { 'git': }
  
  package { 'golang':
      ensure => installed
  }

  file {'/opt/wordcloud':
    ensure => directory,
  }

  file { '/etc/systemd/system/wordcloud.service':
    ensure => file,
    source => 'puppet:///modules/wcg/wordcloud.service'
  }

  exec { 'clone wcg':
    command => '/usr/bin/git clone https://github.com/Fenikks/word-cloud-generator.git .',
    cwd => '/opt/wordcloud',
    returns => [0, 128],
    require => [File['/opt/wordcloud'], Package['git']]
  }

  exec { 'make wcg':
    cwd => "/opt/wordcloud",
    command => 'make',
    path => "/usr/bin:/usr/local/go/bin",
    logoutput => true,
    require => Exec['clone wcg'],
    environment => ['GOPATH=/usr/local/go/bin', 'GOCACHE=/tmp/gocache'],
  }

  service { 'wordcloud':
    ensure => running,
  }

  firewalld_port { 'Open port 8888 in the public zone':
    ensure   => present,
    zone     => public,
    port     => 8888,
    protocol => 'tcp',
  }

  firewalld_service { 'Allow HTTP from the external zone':
      ensure  => 'present',
      service => 'http',
      zone    => 'public',
  }
}
