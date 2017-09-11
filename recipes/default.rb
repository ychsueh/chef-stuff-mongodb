#Cookbook Name:: learn_chef_mongodb
# Recipe:: default
#
#

# Create a /etc/yum.repos.d/mongodb.repo file to hold the configuration
baseurl = "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/"

if node["kernel"]["machine"] != "x86_64"
  baseurl = "http://downloads-distro.mongodb.org/repo/redhat/os/i686/"
end

template "/etc/yum.repos.d/mongodb.repo"  do
  variables(
    :baseurl => baseurl
  )
end

# Install the MongoDB packages and associated tools.
package "mongodb-org" do
  action :install
end

# Start MongoDB.
# ensure that MongoDB will start following a system reboot
service "mongod" do
  action [:start, :enable]
end
