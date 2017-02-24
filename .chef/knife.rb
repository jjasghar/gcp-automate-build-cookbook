current_dir = File.dirname(__FILE__)

log_level                :info
log_location             STDOUT
node_name                "jjasghar"
client_key               "/Users/jjasghar/.chef/jjasghar.pem"
validation_client_name   "jj-model-t-validator"
validation_key           "/Users/jjasghar/.chef/jj-model-t-validator.pem"
chef_server_url          "https://api.chef.io/organizations/jj-model-t"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbok_path            ["#{current_dir}/../cookbooks"]
cache_path               File.expand_path(File.dirname(__FILE__))
ssl_verify_mode         :verify_none
