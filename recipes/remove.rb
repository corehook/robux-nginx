bash "add nginx repo and gpg key to system" do
  user node.user
  group node.group
  ignore_failure true
  code <<-EOC
    sudo wget http://nginx.org/keys/nginx_signing.key -O /tmp/nginx.key
    sudo apt-key add /tmp/nginx.key
    sudo rm /etc/apt/sources.list.d/nginx.list
    sudo apt-get update -y --yes --force-yes
  EOC
end

package 'nginx' do 
  action :purge 
end

include_recipe "robux-nginx::remove_configs"