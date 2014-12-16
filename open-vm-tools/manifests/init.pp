# Class: open-vm-tools
#
# This module manages open-vm-tools
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#

class open-vm-tools {
  if $is_virtual {
    case $operatingsystem {
      'RedHat', 'CentOS': {
        if str2num($operatingsystemmajrelease) >= 7 {
          package { "open-vm-tools": ensure => "installed" }
          service { "vmtoolsd": ensure => "running", enable => "true", }
        }
      }
      'Fedora': {
        if str2num($operatingsystemmajrelease) >= 19 {
          package { 'open-vm-tools': ensure => 'installed', }
          service { 'vmtoolsd': ensure => 'running', enable => 'true', }
        }
      }
      'Ubuntu': {
        if str2num($operatingsystemmajrelease) >= 10.04 {
          package { 'open-vm-tools': ensure => 'installed', }
          service { 'open-vm-tools': ensure => 'running', enable => 'true', }
        }
      }
    }
  }
}
