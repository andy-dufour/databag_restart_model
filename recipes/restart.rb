package 'ntp'

service 'ntp' do
  action [:enable, :start]
end

cluster_databag = data_bag_item('cluster', 'restartcluster')

execute 'restart ntp' do
  command 'service ntp restart'
  action :run
  only_if { cluster_databag['nodes'][node.name]['restart_required'] }
  notifies :run, 'ruby_block[clean_restart]', :immediately
end

ruby_block 'clean_restart' do
  block do
    cluster_databag = data_bag_item('cluster', 'restartcluster')
    cluster_databag['nodes'][node.name]['restart_required'] = false
    cluster_databag.save
  end
end
