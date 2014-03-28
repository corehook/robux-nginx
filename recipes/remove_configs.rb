bash "remove default configs from conf.d" do 
  user node.user
  group node.group
  ignore_failure true
  code <<-EOC
    sudo rm -rf #{node.nginx.dirs.conf_dir}/*
  EOC
end