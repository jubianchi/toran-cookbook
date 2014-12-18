name                   'toran'
maintainer             'jubianchi'
maintainer_email       'contact@jubianchi.fr'
license                'MIT'
description            'Installs/Configures Toran Proxy'
long_description       IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version                '1.0.0'

depends                'apt'
depends                'yum'
depends                'apache2'
depends                'php'

supports               'debian'
supports               'centos'

recipe 'toran',          'Installs Toran Proxy'
recipe 'toran::php',     'Sets up PHP5'
recipe 'toran::apache2', 'Sets up Toran Proxy virtual host for Apache2'
recipe 'toran::nginx',   'Sets up Toran Proxy virtual host for NginX'
