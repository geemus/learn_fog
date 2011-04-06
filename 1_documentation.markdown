h1. Documentation

Your first task will be to practice storing data, but first we will explore how to find information on tasks in documentation.

h2. Amazon Simple Storage Solution (S3)

We will be using S3 to store a file, I usually fall back to the internet to find collected [Amazon S3 documentation](http://aws.amazon.com/documentation/s3). But rather than messing with that there should also be a copy of the relevant documents in your unzipped resources at `learn_fog/documentation/s3/developer_guide` and `learn_fog/documentation/s3/api_documentation`.

h3. Amazon API Guide

The API guides for amazon services provide details on available operations. Our first task will be to create something to hold our files, something S3 refers to as a bucket.

* Open `learn_fog/s3-api.pdf`
* Browse to the table of contents.
* What operations are available for buckets?
* Browse to the operation that seems most likely to create a bucket.
* Which parameters are required? Which are optional?

h3. fog Services

fog `services` wrap around services that clouds provide. We will want to check out the service that maps to S3, which lives with the other storage services. You can find it by opening `learn_fog/source/lib/fog/storage/aws.rb`, you will refer back to it for the next two sections.

h3. Requests

First you'll see some `requires` and `recognizes`, followed by `collections` and `models`, but we will come back to all that later.  Our real goal is the requests, here you can see the path to them as well as a list of available requests.

h3. fog requests

Most of the time you should be able to get by without needing to refer to those docs, but it can be a good skill to have in your bag of tricks. Next we will see how this documentation relates to the code in fog.

* Open the file corresponding to the request you found to create a bucket. You should be able to find it from its name in `learn_fog/source/lib/fog/storage/requests/aws/?`.
* What arguments are required and optional for this method? (you can just focus on the `Real` version for now)
* How does the documentation and method compare to the S3 documentation?

h3. Real

In this file we can see that in the `Real` module there is a mirror to a lot of what we found before to remind us and help integrate our knowledge of S3 into it's usage in fog. The first part documents the function, starting with a brief description of the methods purpose, followed by a breakdown of the parameters and finally the return value. After this you will see the method itself, which will define what data to send.  This data is all quite useful, but for now we will rely on the `Mock` implementation, so we can skip to that.

h3. Mock

We will be using the version of the method in the `Mock` module, however, since we don't have proper credentials.  You can refer back to the `Real` documentation block for what parameters you can also pass to the `Mock` version, but if you look at the method itself you can see it is quite different.  Rather than making a request out to S3, the mocked method just uses the data to update a hash in memory that represents what commands you have run.

h2. Back in the fog

In `1_storage_requests.html` we will explore connecting to a service and start storing our important data!

h3. Extra Credit

What is the `mock` implementation doing?  How will you delete the bucket?
