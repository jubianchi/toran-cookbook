# toran-cookbook

> Toran Proxy

> A Composer proxy for speed and reliability

> -- [https://toranproxy.com/](https://toranproxy.com/)

## Requirements

* Chef `>= 11.6.0`
* Ruby `>= 1.9.3`

## Platforms

|              | Apache   | NginX   |
| -----------: | :------: | :-----: |
| **Debian**   | X        |         |
| **CentOS**   |          |         |

### Testing

```sh
$ vagrant plugin install vagrant-omnibus
$ vagrant plugin install vagrant-berkshelf
$ vagrant plugin install vagrant-hostmanager

# Testing on Debian 7
$ vagrant up debian

# Testing on CentOS 6.5
$ vagrant up centos

# Open Toran Proxy in a web browser
$ open http://toran
```

## Cookbook

### Requirements

* [apt cookbook](https://github.com/opscode-cookbooks/apt)
* [yum cookbook](https://github.com/opscode-cookbooks/yum)
* [apache2 cookbook](https://github.com/opscode-cookbooks/apache2)
* [php cookbook](https://github.com/opscode-cookbooks/php)

**All the requirements are decribed in the cookbook's [`metadata.rb`](metadata.rb) file and are locked using Berkshelf's lock file.**

### Attributes

See [`default.rb`](attributes/default.rb).

### Recipes

* `toran` To install and configure Toran Proxy web application
* `toran::php` To set up php-fpm'
* `toran::apache2` To use Apache2 web server
* `toran::nginx` To use NginX web server