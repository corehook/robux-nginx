# install nginx 1.4.1 version to server
bash "add nginx repo and gpg key to system" do
  code <<-EOC
    wget http://nginx.org/keys/nginx_signing.key -O /tmp/nginx.key
    sudo apt-key add /tmp/nginx.key
    sudo rm /etc/apt/sources.list.d/nginx.list
    echo deb http://nginx.org/packages/ubuntu/ precise nginx > /etc/apt/sources.list.d/nginx.list
    echo deb-src http://nginx.org/packages/ubuntu/ precise nginx >> /etc/apt/sources.list.d/nginx.list
    apt-get update
  EOC
end

package "nginx"

include_recipe "robux-nginx::write_config"
