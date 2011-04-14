# Storage Requests

We will be using irb to experiment. `?` will designate a blank you should fill in and `!` will represent some output you should check out. We will return to this setup many times so you will save time and trouble if you leave the irb session open somewhere.

First we will boot irb and require fog.

    $ bundle exec irb
    > require 'rubygems'
    > require 'fog'

Rather than signing up for accounts, worrying about internet connections, etc; we will save some time by using the mocks. These provide us with an in-memory simulation of the service great for experimentation and testing.

    > Fog.mock!
    !

Finally we can connect to the service.

    > Fog::Storage.new(:provider => 'AWS')
    !

### Connection Parameters

The first thing you need to know is how to connect to the service. You should have seen an error telling you what you omitted, but you can also find this information in the code. If we jump back to the service file you will notice `requires` and `recognizes`. These represent properties are needed to connect to the service and optional attributes which can be provided. In mock mode credentials must be provided, but can be invalid (or blank).

    > connection = Fog::Storage.new(
      :provider => 'AWS',
      :aws_access_key_id => 'id',
      :aws_secret_access_key => 'key'
      )
    !

## Requests

Just as we can find lists of requests in the service file, we can also find this programmatically.

    > connection.requests
    !

## Mocks

It is worth noting, however, that the mock coverage is not complete.  Some files, such as `learn_fog/lib/fog/storage/requests/aws/put_bucket_website` have no mocks defined. Call it now to see how this is handled.

    > connection.put_bucket_website
    !

### Start Your Engines

So it was a long and winding road, but we should be ready to create our bucket.  Refer back to the request method and you should have everything you need to fill in the blank.

    > connection.put_bucket(?)
    !

### Responses

fog uses Excon (a pure-Ruby HTTP library built for speed) for requests so mocks create fake Excon responses to emulate the `Real` behavior. Each response will three key parts: `status` will contain an integer status code, `headers` will contain a hash of metadata and `body` will contain a hash of the response contents (if any).

### To the Races

Now that we have our bucket, we are ready to store a file.

    > connection.put_object(?)
    !

### The Rest

That may be well and good, but how to we return to this data later?  For that we need `get_bucket` and `get_object` respectively. And although mocks are in memory and will therefore be cleaned up automatically, it is still good practice to cleanup after yourself. For that we will need `delete_object` and `delete_bucket`.

    > connection.get_bucket(?)
    !

    > connection.get_object(?)
    !

    > connection.delete_bucket(?)
    !

    > connection.delete_object(?)
    !

## Highlights

* `Fog::Storage` provides the capability to connect to various cloud storage providers.
* By referring to the service documentation, the definition of the service in fog, or by calling `requests` we can see what requests are available.
* Calling methods that have no mock implementation will raise an error declaring that the mock is undefined.

## Next!

Now that we have seen how to dig around and do low level things you can probably imagine that swapping between providers might not be so easy.  Thankfully fog also has `collections` and `models` to ease the pain.  In [Storage Models](3_storage_models.html) we will use them to repeat these basic operations in a more universal way.

### Extra Credit

* Try following these same steps with the 'google' provider.  It is pretty similar, but you'll notice some subtle differences throughout, especially in non-mocked modes due to differing consistency promises.
