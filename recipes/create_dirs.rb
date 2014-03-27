# CREATE DIRS
# /logs/nginx/#{hostname}
directory "#{node.nginx.dirs.logs}/#{node.nodename}" do
  owner node.nginx.user
  group node.nginx.group
  mode 0755
  recursive true
  action :create
end

# /etc/nginx/ssl/
directory "#{node.nginx.dirs.ssl}" do
  owner node.nginx.user
  group node.nginx.group
  action :create
end
