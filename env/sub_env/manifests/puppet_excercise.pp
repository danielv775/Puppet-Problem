#Automate installation and configuration of Nginx Webserver

class nginxServerDV {

    package { "nginx":
        ensure => installed
    }

    service { "nginx":
        require => Package["nginx"],
        ensure => running,
        enable => true
    }

    file { "/etc/nginx/sites-enabled/default":
        require => Package["nginx"],
        ensure  => absent,
        notify  => Service["nginx"]
    }

    file { "/webroot":
        path => "/tmp/nginx/",
        owner => "root",
        group => "root",
        mode => "0755",
        ensure => "directory"

    }

    exec { "wget":
        command => "/usr/bin/wget https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html",
        cwd => "/tmp/nginx",
        require => File["/webroot"]
    }

    file { "/etc/nginx/sites-available/config":
        require => [
            Package["nginx"],
            File["/webroot"]
        ],
        ensure => "file",
        content =>
            "server {
                listen 8000 default_server;
                server_name _;
                location / {root /tmp/nginx/;
                index index.html;
                }
            }",
        notify => Service["nginx"]
    }

    file { "/etc/nginx/sites-enabled/config":
        require => File["/etc/nginx/sites-available/config"],
        ensure => "link",
        target => "/etc/nginx/sites-available/config",
        notify => Service["nginx"]
    }

}

include nginxServerDV
