# stopping nginx server
#bash "stop and kill all nginx processes" do
#  ignore_failure true
#  user node.user
#  group node.group
#  code <<-EOC
#    sudo service nginx stop
#    sleep 5
#  EOC
#end
service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :stop
end
#service "nginx" do
# service_name "nginx"
# action :stop
#end
