# Storage Requests

We will be using irb to experiment. A `?` will designate a blank you should fill in and a `!` will represent some output you should check out. We will return to this setup many times so you will save time and trouble if you leave the irb session open somewhere.


> ### *Exercise 4: Initializing fog*
>
> First we will boot irb and require fog.
>
>     $ cd learn_fog
>     $ bundle install --local
>     $ bundle exec irb
>     > require 'rubygems'
>     > require 'fog'
>
> Rather than signing up for accounts, worrying about internet connections, etc; we will save some time by using the mocks. These provide us with an in-memory simulation of the service great for experimentation and testing. So the first thing we will do is instruct fog to run all subsequent requests in `Mock` mode.
>
>     > Fog.mock!
>     !
>
> Finally we can connect to the service.
>
>     > Fog::Storage.new(:provider => 'AWS')
>     !
>
> You should see an error about what was omitted, these errors help guide you along without having to always refer back to documentation.
>
> Open the file for the AWS service again and check the `requires` and `recognizes`, then we can fill in the blanks using this information.
>
>     > connection = Fog::Storage.new(
>       :provider => 'AWS',
>       :aws_access_key_id => 'id',
>       :aws_secret_access_key => 'key'
>       )
>     !

## Requests

Requests form the bridge between fog and the various cloud services. Now that we have a connection we can use it to interact with S3.

> ### *Exercise 5: Getting Your Hands Dirty*
>
> We should be ready to create our bucket. Refer back to the request method to fill in the blank.
>
>     > response = connection.put_bucket(?)
>     !
>
> fog uses Excon (a pure-Ruby HTTP library built for speed) for requests, so mocks create fake Excon responses to emulate the `Real` behavior.
>
> Each response will three key methods: `status` will return an integer status code, `headers` will return a hash of metadata and `body` will return a hash of the response contents (if any).
>
> Call these methods to get back relevant data from the response.
>
> Now that we have our bucket, we are ready to store a file. HINT: It is easiest to use a string for the body.
>
>     > connection.put_object(?)
>     !
>
> That may be well and good, but how to we return to this data later?  For that we need `get_bucket` and `get_object` respectively. And although mocks are in memory and will therefore be cleaned up automatically, it is still good practice to cleanup after yourself. For that we will need `delete_object` and `delete_bucket`.
>
>     > connection.get_bucket(?)
>     !
>
>     > connection.get_object(?)
>     !
>
>     > connection.delete_object(?)
>     !
>
>     > connection.delete_bucket(?)
>     !
>
> Note: mock coverage is not complete.  Some files, such as [learn_fog/lib/fog/storage/requests/aws/put_bucket_website](lib/fog/storage/requests/aws/put_bucket_website) have no mocks defined. Call it now to see how this is handled.
>
>     > connection.put_bucket_website
>     !

## Highlights

* `Fog::Storage` provides the capability to connect to various cloud storage providers.
* By referring to the service documentation, the definition of the service in fog, or by calling `requests` we can see what requests are available.
* Calling methods that have no mock implementation will raise an error declaring that the mock is undefined.

## Next!

Now that we have seen how to dig around and do low level things you can probably imagine that swapping between providers might not be so easy.  Thankfully fog also has `collections` and `models` to ease the pain.  In [Storage Models](3_storage_models.html) we will use them to repeat these basic operations in a more universal way.

### Extra Credit

* Try following these same steps with the 'google' provider.  It is pretty similar, but you'll notice some subtle differences throughout, especially in non-mocked modes due to differing consistency promises.
* What changes from S3?
* What remains the same?
