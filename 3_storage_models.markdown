# Storage Models

Time to dig back into the code, refer back to `storage/aws`, but this time we will dig into the `collections` and `models`.

Just like last time, the first thing we need is something to contain our file. fog calls this a `directory`, and the `directories` collection represents all of these you have created. It has a number of methods to help you manage directories, which we will experiment with now.

> ### *Exercise 6: Getting Started with Collections*
>
>     > connection.directories
>     !
>
>     > directory = connection.directories.create(:key => ?)
>     !
>
>     > connection.directories
>     !

## How?

You can always follow the `model_path` from the service to find model files and cross reference how they work.
Note that `models` rely on `requests` to do their job, just like we did earlier.
This allows them to hook into the mocking infrastructure as well, and if there is ever anything that the models do not provide you are free to use `requests` to fill in the blanks.

> ### *Exercise 7: Exploring Directories*
>
> * Open [learn_fog/source/storage/models/aws/directories.rb](source/storage/models/aws/directories.rb).
> * First, see the call to `model`, this defines what model to use when you instantiating collection members.
> * Look at `all` and `get`, there is extra code but at their core they should look quite similar to last lesson.
> * What is different from the requests we used?
> * Notice that there is no `Real` vs `Mock` distinction. It is not needed at this level because it can piggy back on the requests.
> * `directories` inherits from `Fog::Collection`. You will not need to know to much more than that, but you can dig into if you would like at [learn_fog/source/lib/fog/core/collection.rb](source/lib/fog/core/collection.rb).

> ### *Exercise 8: Exploring Directory*
>
> You may have noticed that as we were working through things earlier you would usually refer to `directories` but that they returned one or more `directory`.
>
> * Open up [learn_fog/source/lib/fog/storage/models/aws/directory.rb](source/lib/fog/storage/models/aws/directory.rb).
> * At the start we can see `identity` specifies what attribute is the unique id of the object and subsequent `attribute` calls to declare what other values there are (and in some cases remap them from raw results and/or typecast them)
> * Next you will see a number of other methods that should look familiar, in particular look at `save`.
> * `save` builds up options from the attributes and then calls a request, just as we did.
> * What about `create`?

> ### *Exercise 9: Use Your Learning*
>
> Nested inside each `directory` is a `files` `collection`, with much the same methods as the directory itself. You can open up the file to browse, or just experiment and let errors guide the way.
>
>     > file = directory.files.create
>     !
>
>     > file = directory.files.create(?)
>     !
>
>     > file.reload
>     !
>
>     > directory.files
>     !
>
>     > directory.files.table
>     !
>
>     > directory.files.table([:key, :content_length])
>     !
>
>     > directory.files.get(?)
>     !
>
> Finally we will get rid of our creations to get back to a clean slate.
>
>     > file.destroy
>     !
>
>     > directory.destroy
>     !

## Highlights

* Models provide a high level abstraction on top of requests.
* Collections provide the main interface and represent a group of objects.
* The `model` abstraction is easier to use and provides feedback about incorrect usage.

## Next!

Now that we have done this from scratch in irb a couple times we will see how we how the fog command line can help out in [fog Binary](4_fog_binary.html).

### Extra Credit

* Setup a connection to the `Google` provider and work back through the above examples.
* How does the output change?
* What stays the same?
