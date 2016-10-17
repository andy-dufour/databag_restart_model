ruby_block 'Notify Restart' do
  block do
    cluster_databag = data_bag_item('cluster', 'mycluster')
    p cluster_databag['nodes']
    cluster_databag['nodes'].each do |cluster_node, restart_status|
      restart_status['restart_required'] = true
    end
    cluster_databag.save
  end
end
