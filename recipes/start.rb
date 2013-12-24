include_recipe "robux-nginx::stop"

# stopping nginx server
#bash "start nginx processes" do
#  ignore_failure true
#  user node.user
#  group node.group
#  code <<-EOC
#    sudo service nginx start
#  EOC
#end


service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :start
end
