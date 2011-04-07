# Models

Time to dig back into the code, refer back to `storage/aws`, it is now time for us to dig into the `collections` and `models`.

## Collections

Just like last time, the first thing we will need is something to contain our file. Rather than trying to use 'bucket' or 'container' or any of the other words cloud providers uses fog uses the more generic 'directory'.  So the directories collection represents all of the directories you have created.  It has a number of methods to help you manage directories, which we will experiment with now.

    $ irb -r rubygems -r fog
    > Fog.mock!
    > connection = Fog::Storage.new(:provider => 'AWS', :aws_access_key_id => 'fake_access_key_id', :aws_secret_access_key => 'fake_secret_access_key')
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

    ...
    > directory = connection.directories.new(:key => ?)
    !

    > connection.directories.all
    !

    > directory.save
    !

    > connection.directories.all
    !

    > connection.directories.reload
    !

    > directory.destroy
    !

    > directory = connection.directories.create(:key => ?)
    !

## How?

You can always follow the model_path from the service to find the model files and cross reference how things work.  You should note that just like we did before, `models` rely on `requests` to do their job.  This allows them to hook into the mocking infrastructure as well, but it also means that if there is ever anything that the models do not provide you are still free to use `requests`.  Plus this provides a great place to see examples of the `requests` in action.  Now we will explore these files a bit to see how this works.

### Collections

The first thing we will look at is `collections`.  You may have noticed that as we were working through things earlier you would usually refer to `directories` but that they were composed of and often returned one or more `directory`.  We will start by looking at the collection.  Open `learn_fog/source/storage/models/aws/directories.rb`.

* The first thing to notice is that this collection inherits from `Fog::Collection`.  You will not need to know to much more than that, but you can dig into if you would like at `learn_fog/source/lib/fog/core/collection.rb`.
* Next up, see the call to `model`, this tells the collection what model to use when you call new and what model to map data into when you call all or get.
* Look at `all` and `get`, there is some extra helper code but at their core they should look pretty familiar to you.
* Notice that there is no `Real` vs `Mock` distinction. It is not needed at this level because it can piggy back on the requests.

### Models

Now we can look at the `model` that this collection refered to. Models have a bit more going on, but we will walk through it now.

* At the start we can see `identity` to call out what attribute is the unique id of the object and `attributes` to declare what other values there are (and in some cases remap them from raw results or even typecast them)
* Next you will see a number of other methods that should again look familiar, in particular lets look at `save`.
* `save` builds up options from the attributes and then calls a request, this should look very familiar to you.
* What about `create`? This is really just `new` followed by `save`, to validate this you can check out the model parent class at `learn_fog/source/lib/fog/core/model.rb`

## Files.

Nested inside each directory is a files collection, with much the same methods as the directory itself. You can open up the file to browse, or just experiment and let the errors guide your way.

    ....
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

    ...
    > file.destroy
    !

    > directory.destroy
    !

### Extra Credit

Setup a connection to the `Google` provider and work back through the above examples.  How does the output change?  What stays the same?
