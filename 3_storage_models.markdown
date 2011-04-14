# Storage Models

Time to dig back into the code, refer back to `storage/aws`, but this time we will dig into the `collections` and `models`.

## Collections

Just like last time, the first thing we need is something to contain our file. fog calls this a `directory`, and the `directories` collection represents all of these you have created. It has a number of methods to help you manage directories, which we will experiment with now.

    $ bundle exec irb -r rubygems -r fog
    > Fog.mock!
    > connection = Fog::Storage.new(
      :provider => 'AWS',
      :aws_access_key_id => 'id',
      :aws_secret_access_key => 'key'
      )
    > connection.directories
    !

    > connection.directories.all
    !

    > connection.directories.new
    !

    > connection.directories.all
    !

## Models

These collections may start empty, but generally when you are working with them they will contain one or more `directory` `models`, which also have a number of helpful methods.  If we open up `learn_fog/source/lib/fog/storage/models/aws/directory.rb` we can see what this looks like.  We can see the various methods that are defined, see what value is used for identity and what attributes are used in general.

    > directory = connection.directories.new(?)
    !

    > connection.directories.all
    !

    > directory.save
    !

    > connection.directories.all
    !

    > directory.destroy
    !

## How?

You can always follow the `model_path` from the service to find model files and cross reference how they work. Note that `models` rely on `requests` to do their job, just like we did earlier. This allows them to hook into the mocking infrastructure as well, and if there is ever anything that the models do not provide you are free to use `requests` to fill in the blanks.

### Directories

You may have noticed that as we were working through things earlier you would usually refer to `directories` but that they returned one or more `directory`.  We will start by looking at the `collection`.  Open `learn_fog/source/storage/models/aws/directories.rb`.

* First, see the call to `model`, this defines what model to use when you instantiating collection members.
* Look at `all` and `get`, there is some extra code but at their core they should look quite similar to the last lesson.
* What is different from the requests we used?
* Why is it different?
* Notice that there is no `Real` vs `Mock` distinction. It is not needed at this level because it can piggy back on the requests.
* `directories` inherits from `Fog::Collection`. You will not need to know to much more than that, but you can dig into if you would like at `learn_fog/source/lib/fog/core/collection.rb`.

### Directory

Now we can look at the `model` that this collection refered to. Models have more going on, but we will walk through it now.

* At the start we can see `identity` specifies what attribute is the unique id of the object and subsequent `attribute` calls to declare what other values there are (and in some cases remap them from raw results and/or typecast them)
* Next you will see a number of other methods that should look familiar, in particular look at `save`.
* `save` builds up options from the attributes and then calls a request, just as we did.
* What about `create`?

## Files.

Nested inside each `directory` is a `files` `collection`, with much the same methods as the directory itself. You can open up the file to browse, or just experiment and let errors guide the way.

    > file = directory.files.create
    !

    > file = directory.files.create(?)
    !

    > file.reload
    !

    > directory.files.all
    !

    > directory.files.table
    !

    > directory.files.table([:key, :content_length])
    !

    > directory.files.get(?)
    !

## Cleaning Up

    > file.destroy
    !

    > directory.destroy
    !

## Highlights

* Models provide a high level abstraction on top of requests.
* Collections provide the main interface and represent a group of objects.
* The `model` abstraction is easier to use and provides feedback about wrong usage.

## Next!

Now that we have done this from scratch in irb a couple times we will see how we how the fog command line can help out in [fog Binary](4_fog_binary.html).

### Extra Credit

* Setup a connection to the `Google` provider and work back through the above examples.
* How does the output change?
* What stays the same?
