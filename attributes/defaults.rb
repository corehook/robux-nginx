node.default[:ssl_key] = "#{node.nginx.dirs.ssl}/#{node.nginx.tpl.yek.dst}"
node.default[:ssl_crt] = "#{node.nginx.dirs.ssl}/#{node.nginx.tpl.crt.dst}"

