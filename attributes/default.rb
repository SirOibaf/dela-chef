
default.dela.version               = "0.1.0"
default.dela.group                 = "dela"
default.dela.user                  = "dela"
default.dela.url                   = "http://snurran.sics.se/hops/dela-#{node.dela.version}.tar.gz"
default.dela.dir                   = "/srv"
default.dela.base_dir              = node.dela.dir + "/dela"
default.dela.home                  = node.dela.base_dir + "-" + node.dela.version

default.dela.public_ips            = ['10.0.2.15']
default.dela.private_ips           = ['10.0.2.15']


default.java.jdk_version           = "7"
