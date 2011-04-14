# Introduction

fog is the Ruby cloud services library, but what does that even mean?

## Cloud Services

Cloud services have a few distinguishing characteristics. First, they provide on-demand service allowing you to add and remove resources as needed. Similarly, cloud services allow you to pay for usage, rather than by time period. This combination is very powerful, but comes at the cost of foregoing some control and knowledge of the actual resources.

## fog

fog interfaces with various cloud services to simplify the process of using and migrating between them. Evaluating services to find best fit and getting up and running are facilitated while avoiding the significant up front investment this might otherwise entail. For the rest of our time today we will explore some of these services and how fog make it easier to interact with them.

## Agenda

0. Introduction (done!) and Setup
1. Documentation - explore the documentation a service provides and how to navigate it.
2. Storage Requests - use a simulated service with simple requests and responses.
3. Storage Models - use models and see the benefits of abstraction.
4. Local Storage - use our storage models to load and store files locally
5. Compute Models - use a simulated service to explore compute providers
6. Conclusion - review, suggestions for further study and time for questions.

## Setup

For the setup get a copy of `learn_fog.zip`, and unpack to find the rest of the files you need and instructions on how to use them.

    $ cd learn_fog
    !

    $ bundle install --local
    !

### Next!

We will dig into how to figuring out how a particular service works in [Storage Documentation](1_storage_documentation.html).

## Extra Credit

* Install things directly on to your system so they will be available.
