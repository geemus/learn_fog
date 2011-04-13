# Local Storage

Now that we have explored mock requests and models for storage we will try the local storage provider. This provider allows us to choose a local directory to treat like a storage service and save/load files.

## Setup

First, create a directory to use for our local store.

    $ mkdir ?

Now connect to the service and let fog know where this directory is (note: no mock! this time)

TODO: rewrite to use fog binary

    $ irb -r rubygems -r fog
    > connection = Fog::Storage.new(:provider => 'Local', :local_root => '?')
    !

## Storing and Retreiving Files

Just like with our mock providers we need to create a place to put our files.

    > directory = connection.directories.create(?)
    !

Unlike the `Mock` case, we can actually see this in action. Browse to your local_root to find the directory you just created. Now, lets create a file.

    > directory.files.create(?)
    !

ake sure that our file was created correctly and that the data was set correctly. With these basics in hand, go back and try other operations and see if they do what you expect.

## Nitty Gritty

Now that we have explored we will see what makes this service tick. The files in question are in `learn_fog/source/lib/fog/storage/models/local`. In particular, we will want to look at `directories` and `directory`

* How do the available methods compare to the AWS models?
* How do these work?
* Where are the requests?
* How about mocking?

TODO: Expand?

## Storage specific actions:

So far we have used methods of `collections` and `models` that are common across services.  We can see examples of utilizing these common parts in the examples at `learn_fog/source/examples/storage_tests` or by checking out the shared tests at `learn_fog/tests/storage/models/*`.  In both cases you can see that the tests are actually run with all of the providers, so you should feel confident that unlike when using requests, things that are written with the shared models should interoperate, in fact these examples serve as an example of best practices for interoperability.

* What additional methods are available for storage providers?
* What do these methods do?
* How do these methods work?
* Try these methods with Local and mock AWS.

TODO: Expand?

TODO: Highlights

## Next!

Now that you have a good handle on storage we will take a foray into the magical world of compute in `5_compute_models`.  Here you will see how easy it can be to pick up new services after learning your first one.

### Extra Credit

Now that you have a good handle on `Mock` and `Real` as well as `requests`, `collections` and `models`, it would be a great time to explore some of the other storage services.  Which ones do and do not work in mocked?  How do the models differ?  How do the requests differ?
