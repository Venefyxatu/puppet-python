class python::install {

  $python = $python::version ? {
    'system' => 'python',
    default  => "python${python::version}",
  }

  package { $python: ensure => present }

  $dev_ensure = $python::dev ? {
    true    => present,
    default => absent,
  }

  package { 'pip': ensure => $dev_ensure, category => 'dev-python' }

  $venv_ensure = $python::virtualenv ? {
    true    => present,
    default => absent,
  }

  package { 'virtualenv': ensure => $venv_ensure }

  $gunicorn_ensure = $python::gunicorn ? {
    true    => present,
    default => absent,
  }

  package { 'gunicorn': ensure => $gunicorn_ensure }

}
