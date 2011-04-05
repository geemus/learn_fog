h1. Models

Time to dig back into the code, this time we want to look at `storage/local`. You will see that in this case we are doing things locally so there are no requests (or mocks).  So this time around we will really be storing things.

h2. Setup

    $ mkdir ?

h2. Collections

Just like last time, the first thing we will need is something to contain our file. Rather than trying to use 'bucket' or 'container' or any of the other words cloud providers uses fog uses the more generic 'directory'.  So the directories collection represents all of the directories you have created inside your specified `local_root`.  It has a number of methods to help you manage directories, which we will experiment with now.

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

h2. Models

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

h2. How?

You can always follow the model_path from the service to find the model files and cross reference how things work.  You should note that just like we did before, `models` rely on `requests` to do their job.  This allows them to hook into the mocking infrastructure as well, but it also means that if there is ever anything that the models do not provide you are still free to use `requests`.  Plus this provides a great place to see examples of the `requests` in action.

h2. Files.

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

h2. Cleaning Up

    ...
    > file.destroy
    !

    > directory.destroy
    !

h2. Storage specific actions:

Storage has some methods common methods across services other than just the basics of `collections` and `models`.  We can see some an example of utilizing these common parts in the examples at `learn_fog/source/examples/storage_tests` or by checking out the shared tests at `learn_fog/tests/storage/models/*`.  In both cases you can see that the tests are actually run with all of the providers, so you should feel confident that unlike when using requests, things that are written with the shared models should interoperate.

h3. Extra Credit

Setup a connection to the `Google` provider and work back through the above examples.  How does the output change?  What stays the same?