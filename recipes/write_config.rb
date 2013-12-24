include_recipe "robux-nginx::create_dirs"
include_recipe "robux-nginx::write_ssl_keys"

bash "remove default configs from conf.d" do 
  code <<-EOC
    rm -rf #{node.nginx.dirs.conf_dir}/*
  EOC
end

nginx_conf = "#{node.nginx.dirs.base_dir}/#{node.nginx.tpl.nginx.dst}"
nginx_conf_src = "#{node.nginx.tpl.nginx.src}"

template nginx_conf do
  source nginx_conf_src
  owner node.user
  group node.user
  mode 0775
  variables({
      :user => node.nginx.user,
      :workers => node.nginx.workers,
      :log_dir => node.nginx.dirs.logs,
      :error_log => node.nginx.logs.error_log,
      :error_log_level => node.nginx.logs.error_log_level,
      :worker_connections => node.nginx.worker_connections,
      :access_log => node.nginx.logs.access_log,
      :access_log_level => node.nginx.logs.access_log_level,
      :include_conf_dir => node.nginx.dirs.conf_dir
  })
end

template "#{node.nginx.dirs.base_dir}/proxy.inc" do
  source 'nginx/proxy.inc.erb'
  owner node.nginx.user
  group node.nginx.user
  mode 0775
end

template "#{node.nginx.dirs.conf_dir}/#{node.nginx.tpl.app.dst}" do
  source "#{node.nginx.tpl.app.src}"
  owner node.nginx.user
  group node.nginx.group
  mode 0775
  variables({
    :balancer_ip => "#{node.nginx.balancer_ip}",
    :env => "#{node.robux.rails_env}",
    :public_hostname => "#{node.public_hostname}",
    :nodename => "#{node.nodename}",
    :project_dir => "/opt/robux/app",
    :ssl_crt => "#{node.ssl_crt}",
    :ssl_key => "#{node.ssl_key}"
  })
end

