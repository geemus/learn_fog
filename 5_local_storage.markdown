# Local Storage

Now that we have explored mock requests and models for storage we'll give the local storage provider a shot. This provider allows us to choose a local directory to treat like a storage service and save/load files from.

## Setup

First we should make sure that the directory we will be using exists

    $ mkdir ?

Now we connect to the service and let fog know where this directory is (note: no mock! this time)

    $ irb -r rubygems -r fog
    > connection = Fog::Storage.new(:provider => 'Local', :local_root => '?')
    !

## Storing and Retreiving Files

Just like with our mock providers we need to create a place to put our files.

    ...
    > directory = connection.directories.create(?)
    !

Unlike the examples of the mock case, however, we can actually see this in action.  If you browse to the location where you created your local_root you should be able to see the directory that you just created. With that in hand, lets create a file.

    > directory.files.create(?)
    !

And just like we can check our filesystem for a folder we can check to make sure that our file was created correctly and that the data was set correctly. With these basics in hand, go back and try other operations and see if they do what you expect.

## Nitty Gritty

Now that we have had an opportunity to explore we can go see what makes this service tick.  The files in question are in `learn_fog/source/lib/fog/storage/models/aws`.  Just like before we will want to look at `directories` and `directory`

* How do the available methods compare to the AWS models?
* How do these work?
* Where are the requests?
* How about mocking?

## Storage specific actions:

So far we have used methods of `collections` and `models` that are common across services.  We can see some an example of utilizing these common parts in the examples at `learn_fog/source/examples/storage_tests` or by checking out the shared tests at `learn_fog/tests/storage/models/*`.  In both cases you can see that the tests are actually run with all of the providers, so you should feel confident that unlike when using requests, things that are written with the shared models should interoperate, in fact these examples serve as an example of best practices for interoperability.

* What additional methods are available for storage providers?
* What do these methods do?
* How do these methods work?
* Try these methods with Local and mock AWS.

## Next!

Now that you have a good handle on storage we will take a foray into the magical world of `5_compute_models`.  Here you will see how easy it can be to pick up new services after you figure out your first one.

### Extra Credit

Now that you have a good handle on `Mock` and `Real` as well as `requests`, `collections` and `models`, it would be a great time to explore some of the other storage services.  Which ones do and do not work in mocked?  How do the models differ?  How do the requests differ?
