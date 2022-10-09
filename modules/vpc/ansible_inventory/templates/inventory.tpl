---
all:
  children:
%{ if length(instances) > 0 ~}
    default:
      hosts:
%{ for instance in instances ~}
        ${ instance.access_ip_v4 }:
%{ endfor ~}
%{ if length(floating_ips) > 0 ~}
    floating_ip:
      hosts:
%{ for item in floating_ips ~}
        ${ item.address }:
%{ endfor ~}
%{ endif ~}
%{ for tag in tags ~}
    ${ tag }:
      hosts:
%{ for instance in instances ~}
%{ if contains(instance.tags, tag) ~}
        ${ instance.access_ip_v4 }:
%{ endif ~}
%{ for floating_ip in floating_ips ~}
%{ if floating_ip.fixed_ip == instance.access_ip_v4 ~}
        ${ floating_ip.address }:
%{ endif ~}
%{ endfor ~}
%{ endfor ~}
%{ endfor ~}
%{ endif ~}
...