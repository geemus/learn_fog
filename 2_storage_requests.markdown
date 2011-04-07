# Requests

In fog `requests` map to the actual API calls that are necessary to carry out your tasks in the cloud.  We'll start by finding the files related to S3.  The first place to look for a shared service is with it's companions.  Since we are interested in storing data we will want to explore the storage providers at `learn_fog/source/lib/fog/storage/`.  There you will see a number of files and folders, we will first look at S3, which is part of the AWS provider.

### Once More With <strike>Feeling</strike> Code!

So lets boot up an irb session and get started.

*Note:* We will keep coming back to this example so you can leave this running to save some typing.

    $ irb
    > require 'rubygems'
    > require 'fog'

Rather than signing up for accounts and worrying about internet connections and etc, we'll go ahead and save some time and effort by using the mocks.  These provide us with a simulation of the service locally in memory, which can be great for experimentation and testing.

    ...
    > Fog.mock!
    !

Finally we can connect to the service.

    ...
    > Fog::Storage.new(:provider => 'AWS')
    !

### Connection Parameters

The first thing you will need to know is how to connect to the service. You should have just seen an error that will tell you what you left out, but you can also find this information in the code. If we jump back to the service file you will notice the `requires` and `recognizes`. These represent what properties are needed to connect to the service and what optional attributes can also be provided. In our case we now know we will need to set `aws_access_key_id` and `aws_secret_access_key`.

    > connection = Fog::Storage.new(:provider => 'AWS', :aws_access_key_id => 'fake_access_key_id', :aws_secret_access_key => 'fake_secret_access_key')
    !

## Requests

Just as we can find lists of requests in the service file, we can also find this out programmatically.

    > connection.requests
    !

## Mocks

It is worth noting, however, that the coverage of mocks is not complete.  Some files have no mock implemented, for example `learn_fog/lib/fog/storage/requests/aws/put_bucket_website`.  It has no mock section what so ever, call it now to find out what happens in this case.

    ...
    > connection.put_bucket_website
    !

### Start Your Engines

So it was a long and winding road, but we should be plenty ready to create our bucket.  Refer back to the request method and you should have everything you need to fill in your first blank.  As we move forward remember how you got to this point because we will need to do it again.

    ...
    > connection.put_bucket(?)
    !

### Responses

fog uses Excon (a pure-Ruby HTTP library built for speed) for its requests so our mocks are setup to create faked Excon responses to emulate the Real behavior.  Each response will have seperated out the three key parts of an HTTP response. `status` will contain an integer representing what status code was returned. Next `headers` returns the meta information about the request parsed into a hash. Last `body` will contain the contents of the response (if any) parsed into a hash as well.

### To the Races

Next we will repeat this process to create our object:

    ...
    > connection.put_object(?)
    !

### The Rest

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

## Next!

Now that we have seen how we can dig around to find out how to do low level things you can probably get a pretty good idea that swapping between providers might not be so easy.  Thankfully fog also has `collections` and `models` to ease the pain.  In `3_storage_models.html` we will use them to store data in our filesystems.

### Extra Credit

Try following these same steps with the 'google' provider.  It is pretty similar, but you'll notice some subtle differences throughout, especially in non-mocked modes due to differing consistency promises.
