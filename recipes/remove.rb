package 'nginx' do 
  action :remove  
end

include_recipe "robux-nginx::remove_configs"