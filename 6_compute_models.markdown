# Compute Models

Cloud compute provides the capability to request remote compute power as it is needed. Typical use cases range from server usage similar to traditional managed hosting all the way through spinning up and down servers to provide utility computing for periodic cpu bound work. We will use a `mock` provider to explore how to use these resources.

> ### *Exercise 13: Learn Compute the Hard Way*
>
> We will go back to using mock aws as our provider, but we will use a compute service this time. This will provide a simulation of Amazon's Elastic Compute Cloud (EC2).
>
>     $ FOG_MOCK=true bundle exec fog
>     > connection = AWS[:compute]
>     !
>
> This should look very familiar (in fact, the only real change is substituting `Compute` for `Storage`). You can use requests, just like before to get an overview of these.  But this time around we are going to skip right to the models, after all if you need to you now know how to look up information about requests and back track through the models if needed.  That being said, there are a lot more collections and they are much different than they were before. We can use the collections method to grab a list of them.
>
>     > connection.collections
>     !
>
> Unfortunately, compute can be more complicated than storage. You can refer to [learn_fog/ec2-api.pdf](ec2-api.pdf) or the code to see how to do things, but for ito keep things simple I will give you the short version.
>
> Create a key_pair, this is what will allow you to ssh into the server later.  You can either specify a public key or leave it blank (in which case you will get a private key returned to you).
>
>     > key_pair = connection.key_pairs.create(?)
>     !
>
> Open port 22 in the security group to allow ssh.  For simplicity we will do this on the default security group, but you could also create a new group and open the port there for the server.
>
>     > security_group = connection.security_groups.get('default')
>     !
>
>     > security_group.authorize_port_range(?)
>     !
>
> Create the server.  Last but not least, make sure to pass an image_id (you can make one up) and the key_pair you just created.
>
>     > server = connection.servers.create(:image_id => 'ami-xyz', :key_pair => key_pair)
>     !
>
> Shutdown and cleanup. (note we will leave the default security group, but just remove the port 22 rights)
>
>     > server.destroy
>     !
>
>     > security_group.revoke_port_range(?)
>     !
>
>     > key_pair.destroy
>     !

> ### *Exercise 14: Exploring Compute*
>
> Just like storage, compute has a number of specific methods. You can learn a lot about these by looking at the tests in `tests/compute/models/`.  The main method we really care about, though, is `bootstrap`.
>
> First we will look at bootstrap, open [learn_fog/lib/fog/compute/models/aws/servers.rb](lib/fog/compute/models/aws/servers.rb).
> Browse to the `bootstrap` method.
> What functions does this encapsulate?
> Once you have a server up and running Open [learn_fog/lib/fog/compute/models/aws/server.rb](lib/fog/compute/models/aws/server.rb).
> Browse to the `setup` function.
> How does bootstrap use this to prepare the server?
> Browse to the `ssh` function.
> How is this used by setup?
> How can you use this to call commands on the server?

## Highlights

* fog has a Compute services that can connect to many different providers and operate similarly.
* Compute resources are more complicated to work with but the interface and resources are familiar.
* Specific methods which seek to reduce complexity are available for compute that can be found in shared tests.

## Next!

Last, but certainly not least, we will wrap up with some highlights and suggestions for how to continue your learning followed by some time for questions in [Conclusion](7_conclusion.html).

### Extra Credit

* There are a lot of compute providers, check and see how they differ and how they are the same.
* Try the operations from this lesson using the `Mock` Rackspace provider.
