# Documentation

Cloud storage provides the capability of uploading files to a persistent remote store that will automatically handle keeping this data safe and available. Our first task will be to store data, but first we will figure out how by referencing the service's documentation.

## Amazon Simple Storage Solution (S3)

We will be using S3 to store a file, you can refer to local docs at [learn_fog/s3-api.pdf](s3-api.pdf) or online at [S3 documentation](http://aws.amazon.com/documentation/s3).

Amazon API guides provide details on available operations. We will first need to create something to hold our files, S3 refers to this as a bucket.

> ### *Exercise 2: Amazon API Guide*
>
> * Open [learn_fog/s3-api.pdf](s3-api.pdf)
> * Browse to 'Put Bucket' in the REST API documentation on page 78.
> * Which parameters are optional and required?

### fog Services

Most of the time you should be able to get by without needing to refer to those docs, but it is a valuable skill to have in your bag of tricks. Next we will see how this documentation relates to fog.

We will want to check out the `service` that maps to S3 and the requests it uses to support S3.

> ### *Exercise 3: fog AWS service*
>
> * Open [learn_fog/source/lib/fog/storage/aws.rb](source/lib/fog/storage/aws.rb), you will refer back to it for the next two sections.
> * Skip down to `request_path`, this defines where in the code files will appear.
> * Open the file for the put_bucket request.
> * Find the method inside the `Real` class.
> * How does the documentation and method compare to the S3 documentation?
> * What arguments are optional and required?

### Real

We can see that there is a mirror between code and pdf, which helps integrate our knowledge of S3 into usage in fog. At the top of put_bucket the commented out section documents a brief description of purpose, followed by a breakdown of parameters and return value. After this you will see the `Real` method itself, which defines how data is sent. Now, we will review the `Mock` implementation, which we will be using in our examples.

### Mock

Rather than sending requests to S3, `Mock` methods simulate S3 locally.

## Highlights

* Cloud services provide documentation about how to use their services.
* fog `requests` map closely to the services API calls and mirrors their documentation.
* `Real` methods actually make API calls.
* `Mock` methods update an in-memory representation of service state.

## Next!

In [Storage Requests](2_storage_requests.html) we will explore connecting to a service and storing our data!

### Extra Credit

* How will you get rid of the bucket?
* What arguments are optional and required?
