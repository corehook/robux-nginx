# template "#{node.nginx.dirs.ssl}/#{node.nginx.tpl.yek.dst}" do
#   source "#{node.nginx.tpl.yek.src}"
#   owner node.nginx.user
#   group node.nginx.group
#   mode 0775
# end

# template "#{node.nginx.dirs.ssl}/#{node.nginx.tpl.crt.dst}" do
#   source "#{node.nginx.tpl.crt.src}"
#   owner node.nginx.user
#   group node.nginx.group
#   mode 0755
# end
