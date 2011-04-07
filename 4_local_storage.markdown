h1. Local Storage

Now that we have explored mock requests and models for storage we'll give the local storage provider a shot. This provider allows us to choose a local directory to treat like a storage service and save/load files from.

h2. Setup

First we should make sure that the directory we will be using exists

    $ mkdir ?

Now we connect to the service and let fog know where this directory is (note: no mock! this time)

    $ irb -r rubygems -r fog
    > connection = Fog::Storage.new(:provider => 'Local', :local_root => '?')
    !

h2. Storing and Retreiving Files

Just like with our mock providers we need to create a place to put our files.

    ...
    > directory = connection.directories.create(?)
    !

Unlike the examples of the mock case, however, we can actually see this in action.  If you browse to the location where you created your local_root you should be able to see the directory that you just created. With that in hand, lets create a file.

    > directory.files.create(?)
    !

And just like we can check our filesystem for a folder we can check to make sure that our file was created correctly and that the data was set correctly. With these basics in hand, go back and try other operations and see if they do what you expect.

h2. Nitty Gritty

Now that we have had an opportunity to explore we can go see what makes this service tick.  The files in question are in `learn_fog/source/lib/fog/storage/models/aws`

  todo: exploring model files, explaining no requests and no mocks?

h2. Storage specific actions:

  todo: emphasis power of generic models/abstraction
  todo: cover examples

Storage has some methods common methods across services other than just the basics of `collections` and `models`.  We can see some an example of utilizing these common parts in the examples at `learn_fog/source/examples/storage_tests` or by checking out the shared tests at `learn_fog/tests/storage/models/*`.  In both cases you can see that the tests are actually run with all of the providers, so you should feel confident that unlike when using requests, things that are written with the shared models should interoperate.

h2. Next!

Now that you have a good handle on storage we will take a foray into the magical world of `5_compute_models`.  Here you will see how easy it can be to pick up new services after you figure out your first one.

h3. Extra Credit

  todo: explore other mocked providers, virtualbox and/or real providers if accounts/internet allows.
