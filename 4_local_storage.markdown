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

  TODO: examples
  TODO: actually opening file in browser, etc

h2. Nitty Gritty

  TODO: exploring model files, explaining no requests and no mocks?

h2. Next!

  TODO: possibly mock compute?

h3. Extra Credit

  TODO: ?
