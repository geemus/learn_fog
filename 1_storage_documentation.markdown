# Documentation

Cloud storage provides the capability of uploading files to a persistent remote store that will automatically handle keeping this data safe and available. Our first task will use this to store data, but first we will figure out how by referencing the services documentation.

## Amazon Simple Storage Solution (S3)

We will be using S3 to store a file, you can refer to local docs at [learn_fog/s3-api.pdf](s3-api.pdf) or online at [S3 documentation](http://aws.amazon.com/documentation/s3).

### Amazon API Guide

Amazon API guides provide details on available operations. We will first need to create something to hold our files, S3 refers to this as a bucket.

* Open `learn_fog/s3-api.pdf`
* Browse to the table of contents.
* What operations are available for buckets?
* Browse to the operation that seems most likely to create a bucket.
* Which parameters are required?
* Which are optional?
* What other operations are available on buckets?

### fog Services

Most of the time you should be able to get by without needing to refer to those docs, but it can be a good skill to have in your bag of tricks. Next we will see how this documentation relates to the code in fog.

We will want to check out the `service` that maps to S3, which lives with the other storage services. You can find it by opening `learn_fog/source/lib/fog/storage/aws.rb`, you will refer back to it for the next two sections.

### Requests

First you will see some `requires` and `recognizes`, followed by `collections` and `models`, we will to these later. Our real goal is requests, you can see the `request_path` and a list of available requests.

* Open the file corresponding to the request you found to create a bucket. You should be able to find it from its name in `learn_fog/source/lib/fog/storage/requests/aws/?`.
* Find the method inside the `Real` module.
* What arguments are required?
* What arguments are optional?
* How does the documentation and method compare to the S3 documentation?

### Real

We can see that there is a mirror to what we found before, which helps integrate our knowledge of S3 into usage in fog. The first part documents the function, starting with a brief description of purpose, followed by a breakdown of parameters and return value. After this you will see the `Real` method itself, which defines how data is sent. For now, we will review the `Mock` implementation, which we will be using in our examples.

### Mock

You can refer back to the `Real` documentation block for usage details, but if you look at the `Mock` method itself you can see it is quite different.  Rather than sending a request to S3, the `Mock` method updates a hash in memory that simulates the remote state.

### http://fog.io

Another great place to find consolidated information is on [fog.io](http://fog.io), but all that info is also available in the source.

    $ cd learn_fog/fog.io

The front page is `index.html` and other pages can be navigated to from there.

## Highlights

* Cloud services provide documentation about how to use their services.
* fog `requests` map closely to the services API calls and mirrors their documentation.
* `Real` methods actually make API calls.
* `Mock` methods update an in-memory representation of service state.
* [fog.io](http://fog.io) collects available documentation and resources.

## Next!

In [Storage Requests](2_storage_requests.html) we will explore connecting to a service and storing our data!

### Extra Credit

* What data does the `mock` method modify?
* How will you get rid of the bucket?
* What does the associated `Real` method look like?
* What data does the associated `Mock` method modify?
