# gcp-demo

This is a basic demo of how to leverage, [knife-google][knife] and [kitchen-google][kitchen]
in an Automate `build_cookbook`. It spins up a machine, installs the chefdk via tk, then if
the deliver button is pushed it will use knife to provision a new machine.

There are options to extend this, but it seems the "correct extension" would be to add
a webserver, then an index.html and change it via changing a template.

You'll need to change these following things:

1. `kitchen.yml` in the root directory
1. Add a firewall rule in your network setup to allow port `80` etc.
1. Update the `build_cookbook` with some attributes.

## kitchen.yml

```yml
driver:
  project: YOURPROJECTNAME
  email: YOUREMAILFORGCP

transport:
  username: YOURUSERNAME
```

## attributes

In the `build_cookbook` here are some examples, you'll need to change them for your setup.

```ruby

# The gce project
default['gce_build_cookbook']['project'] = '167566460353'

# The gce zone
default['gce_build_cookbook']['zone'] = 'us-central1-f'

# The ssh username
default['gce_build_cookbook']['ssh_username'] = 'jjasghar'

# The instance machine type
default['gce_build_cookbook']['machine_type'] = 'n1-standard-2'

# The identity file
default['gce_build_cookbook']['identity_file'] = '/Users/jjasghar/.ssh/google_compute_engine'
```

[knife]: https://github.com/chef/knife-google
[kitchen]: https://github.com/test-kitchen/kitchen-google
