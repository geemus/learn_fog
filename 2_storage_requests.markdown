h1. Requests

In fog `requests` map to the actual API calls that are necessary to carry out your tasks in the cloud.  We'll start by finding the files related to S3.  The first place to look for a shared service is with it's companions.  Since we are interested in storing data we will want to explore the storage providers at `learn_fog/source/lib/fog/storage/`.  There you will see a number of files and folders, we will first look at S3, which is part of the AWS provider.

h2. Service

Open `learn_fog/source/lib/fog/storage/aws.rb`, you will refer back to it for the next two sections.

h3. Parameters

The first thing you will notice are the `requires` and `recognizes`. These represent what properties are needed to connect to the service and what optional attributes can also be provided respectively. In our case we now know we will need to set `aws_access_key_id` and `aws_secret_access_key`.

h3. Requests

Next you will see a list of `collections` and `models`, but we will come back to that later.  Our real goal is the requests, here you can see the path to them as well as a list of available requests.

h3. Once More With <strike>Feeling</strike> Code!

    $ irb -r rubygems -r fog

    > Fog::Storage.new(:provider => 'AWS')
    !

    > Fog.mock!
    !

    > connection = Fog::Storage.new(:provider => 'AWS', :aws_access_key_id => 'fake_access_key_id', :aws_secret_access_key => 'fake_secret_access_key')
    !

    > connection.requests
    !

*Note:* We will keep coming back to this example so you can leave this running to save some typing.

h2. The Venerable Request

Now that we know how to find requests we will review the ones we need to store our data.  We know from reviewing the first thing we need to do is create a container for our file, which S3 calls a bucket.  The particular request we are after in this case is `put_bucket`, which you will want to open now.

h3. Real

In this file we can see that in the `Real` module there is a mirror to a lot of what we found before to remind us and help integrate our knowledge of S3 into it's usage in fog. The first part documents the function, starting with a brief description of the methods purpose, followed by a breakdown of the parameters and finally the return value. After this you will see the method itself, which will define what data to send.  This data is all quite useful, but for now we will rely on the `Mock` implementation, so we can skip to that.

h3. Mock

We will be using the version of the method in the `Mock` module, however, since we don't have proper credentials.  You can refer back to the `Real` documentation block for what parameters you can also pass to the `Mock` version, but if you look at the method itself you can see it is quite different.  Rather than making a request out to S3, the mocked method just uses the data to update a hash in memory that represents what commands you have run.

It is worth noting, however, that the coverage of mocks is not complete.  Some files have no mock implemented, for example `learn_fog/lib/fog/storage/requests/aws/put_bucket_website`.  It has no mock section what so ever, call it now to find out what happens in this case.

    ...
    > connection.put_bucket_website
    !

h3. Start Your Engines

Now we can take what we have learned to fill in the `?` and create our bucket.

    ...
    > connection.put_bucket(?)
    !

h3. Responses

fog uses Excon (a pure-Ruby HTTP library built for speed) for its requests so our mocks are setup to create faked Excon responses to emulate the Real behavior.  Each response will have seperated out the three key parts of an HTTP response. `status` will contain an integer representing what status code was returned. Next `headers` returns the meta information about the request parsed into a hash. Last `body` will contain the contents of the response (if any) parsed into a hash as well.

h3. To the Races

Next we will repeat this process to create our object:

    ...
    > connection.put_object(?)
    !

h3. The Rest

That may be well and good, but how to we get back to this data later?  For that we will need `get_bucket` and `get_object` respectively. And although technically mocks are in memory and will therefore be cleaned up automatically, it is still good practice to do it manually, for that we'll need `delete_object` and `delete_bucket`.

    ...
    > connection.get_bucket(?)
    !

    > connection.get_object(?)
    !

    > connection.delete_bucket(?)
    !

    > connection.delete_object(?)
    !

    > ?

h2. Next!

Now that we have seen how we can dig around to find out how to do low level things you can probably get a pretty good idea that swapping between providers might not be so easy.  Thankfully fog also has `collections` and `models` to ease the pain.  In `3_storage_models.html` we will use them to store data in our filesystems.

h3. Extra Credit

If you left the rest of us in the dust, try following these same steps with the 'google' provider.  It is pretty similar, but you'll notice some subtle differences throughout, especially in non-mocked modes due to differing consistency promises.
