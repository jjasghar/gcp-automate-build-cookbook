#
# Cookbook:: build_cookbook
# Recipe:: deploy
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['delivery']['change']['stage'] == 'delivered'
  bash "bootstrap a permanent node" do
    cwd delivery_workspace_repo
    code <<-EOH
      STATUS=0
      chef exec knife google server delete rehearsal -y -P --gce-project #{node['gce_build_cookbook']['project']} --gce-zone #{node['gce_build_cookbook']['zone']}
      chef exec knife google server create delivered \
        --gce-image ubuntu-1604-lts --gce-machine-type #{node['gce_build_cookbook']['machine_type']} \
        --gce-public-ip ephemeral --ssh-user #{node['gce_build_cookbook']['ssh_username']} \
        --gce-project #{node['gce_build_cookbook']['project']} --gce-zone #{node['gce_build_cookbook']['zone']} \
        --identity-file #{node['gce_build_cookbook']['identity_file']} \ -r 'recipe[gcp_demo::default]' || STATUS=1
      exit $STATUS
     EOH
  end
end
