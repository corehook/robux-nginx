dpkg_package "purge nginx packages from server" do
  package_name "nginx"
  action :purge
end

