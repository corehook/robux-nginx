# install nginx 1.4.1 version to server
bash "add nginx repo and gpg key to system" do
  user node.user
  group node.group
  ignore_failure true
  code <<-EOC
    sudo wget http://nginx.org/keys/nginx_signing.key -O /tmp/nginx.key
    sudo apt-key add /tmp/nginx.key
    sudo rm /etc/apt/sources.list.d/nginx.list
    sudo sh -c "echo deb http://nginx.org/packages/ubuntu/ precise nginx > /etc/apt/sources.list.d/nginx.list"
    sudo sh -c "echo deb-src http://nginx.org/packages/ubuntu/ precise nginx >> /etc/apt/sources.list.d/nginx.list"
    sudo apt-get update -y --yes --force-yes
  EOC
end

package "nginx" do
  action :install
  options "--force-yes -y"
end

include_recipe "robux-nginx::write_config"
