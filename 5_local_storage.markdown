# Local Storage

Now that we have explored mock requests and models for storage we will try the local storage provider. This provider allows us to choose a local directory to treat like a storage service and save/load files.

> ### *Exercise 11: Utilizing Local Storage*
>
> First, exit the fog binary and create a directory to use for our local store.
>
>     $ mkdir ?
>
> Now open up `~/.fog` and add a key for `:local_root:` with the path to the directory you just created. Now you are ready to connect to the service. Note that we will not be setting FOG_MOCK this time.
>
>     $ bundle exec fog
>     > connection = Local[:storage]
>     !
>
>
> Just like with our mock providers we need to create a place to put our files, using the same arguments to create as last lesson.
>
>     > directory = connection.directories.create(?)
>     !
>
> Unlike the `Mock` case, we can actually see this in action. Browse to your local_root to find the directory you just created. Now, lets create a file, again using the same arguments as last lesson.
>
>     > directory.files.create(?)
>     !
>
> Make sure that our file was created correctly and that the data was set correctly. With these basics in hand, go back and try other operations and see if they do what you expect.

> ### *Exercise 12: Exploring Local Storage*
>
> Now that we have explored we will see what makes this service tick. The files in question are in [learn_fog/source/lib/fog/storage/models/local](source/lib/fog/storage/models/local). In particular, we will want to look at `directories` and `directory`
>
> How do the available methods compare to the AWS models?
>
> How do these work?
>
> So far we have used methods of `collections` and `models` that are common across services, we can see examples in the shared tests.
>
> Open [learn_fog/source/examples/storage_tests](source/examples/storage_tests) and/or `learn_fog/tests/storage/models/*`.
>
> What additional methods are available for storage providers?
>
> What do these methods do?
>
> Try these methods with Local.

## Highlights

* Storage can connect to different services and will continue to work largely the same.
* Local storage provides a way to emulate cloud storage behavior on your local filesystem.
* Local storage is defined at the model level and has no mocking.
* Storage has some specific capabilities that differ from core fog, these can be explored in the shared examples and tests.

## Next!

Now that you have a good handle on storage we will take a foray into the magical world of compute in [Compute Models](6_compute_models.html).  Here you will see how easy it can be to pick up new services after learning your first one.

### Extra Credit

Now that you have a good handle on `Mock` and `Real` as well as `requests`, `collections` and `models`, it would be a great time to explore some of the other storage services.

* Try the shared methods with `Mock` AWS Storage.
* Explore other services.
* Which ones do and do not work in mocked?
* How do the models differ?
* How do the requests differ?
