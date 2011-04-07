h1. Compute

Now that we have had a pretty thorough overview of storage services we will jump over and try our hand at compute.  Thankfully you will be able to reuse a lot of what you have already learned.

h2. Setting Up

We will go back to using mock aws as our provider, but we will use a compute service this time. This will provide a simulation of Amazon's Elastic Compute Cloud (EC2).

    $ irb
    > require 'rubygems'
    > require 'fog'
    > Fog.mock!
    > connection = Fog::Compute.new(:provider => 'AWS', :aws_access_key_id => 'fake_access_key_id', :aws_secret_access_key => 'fake_secret_access_key')
    !

This should look very familiar (in fact, the only real change is substituting `Compute` for `Storage`). You can use requests, just like before to get an overview of these.  But this time around we are going to skip right to the models, after all if you need to you now know how to look up information about requests and back track through the models if needed.  That being said, there are a lot more collections and they are much different than they were before. We can use the collections method to grab a list of them.

    ...
    > connection.collections
    !

h2. Configuring Your Server

Unfortunately, unlike working with storage, compute setup can be pretty complicated at times. You have the resources now to look up why this stuff needs to happen, but for now I will give you the run down.

1. Create a key_pair, this is what will allow you to ssh into the server later.  You can either specify a public key or leave it blank (in which case you will get a private key returned to you).

    ...
    > key_pair = connection.key_pairs.create(?)
    !

2. Open port 22 in the security group to allow ssh.  For simplicity we will just open port 22 on the default security group, but you could also create a new group and open the port there for the server.

    ...
    > security_group = connection.security_groups.get('default')
    !

    > security_group.authorize_port_range(?)
    !

3. Create the server.  Last but not least, make sure to pass the key_pair and security_group that you just specified.

    ...
    > server = connection.create_server(?)
    !

4. Shutdown and cleanup. (note we will leave the default security group, but just remove the port 22 rights)

    > server.destroy
    !

    > security_group.revoke_port_range(?)
    !

    > key_pair.destroy
    !

h2. Compute Specifics

Just like in the storage case, compute also has a number of specific methods to it.  Unfortunately, since I am still in the process of nailing down some of this stuff (as you saw this is a harder problem than storage) there is no set of examples for it.  You can learn a lot, however, by looking at the tests in `tests/compute/models/`.  The main one we really care about, though, is `bootstrap`.

* First we will look at bootstrap, open `learn_fog/lib/fog/compute/models/aws/servers`.
* Browse to the `bootstrap` method.
* What functions does this encapsulate?

* Once you have a server up and running Open `learn_fog/lib/fog/compute/models/aws/server`.
* Browse to the `setup` function.
* How does bootstrap use this to prepare the server?
* Browse to the `ssh` function.
* How is this used by setup?
* How can you use this to call commands on the server?

h2. Next!

Last, but certainly not least, we will wrap up with some highlights and suggestions for how to continue your learning followed by some time for questions.

h3. Extra Credit

There are a lot of compute providers, check and see how they differ and how they are the same.
