h1. Introduction

fog is the Ruby cloud services library.  But what does that really mean anyway?

h2. Cloud Services

Cloud services have a few important points that distinguish them.  First, they are provided on-demand which allows you to add and remove resources as you need them.  Closely related to this, cloud services allow you to pay only for what you actually use (rather than a recurring flat rate). This combination is very powerful, but can come at the cost of giving up some level of control and knowledge about the actual resources.

h2. fog

fog comes into the picture by interfacing with these various services and working to simplify the process of using them (and migrating between them). By doing so it makes it easier to evaluate services to find the best fit and get up and running while avoiding the significant up front investment to knowledge gathering this might otherwise entail. For the rest of our time today we will explore some of these services and how fog can make it easier for us to interact with them.

h2. Agenda

0. Introduction (done!) and Setup
1. Documentation - explore the documentation a service provides and how to navigate them.
2. Storage Requests - start using a simulated service with simple requests and responses.
3. Storage Models - simplify by using models instead of requests and see the benefits of this abstraction.
4. Local Storage - use our new knowledge of storage models to actually load and store files locally
5. Compute Models - use another simulated service to explore compute providers
6. Conclusion - review what we have learned, suggestions for further study and time for questions.

h2. Setup

  TODO: describe steps to setup

h4. Next!

Next we will dig into how to figure out how a particular service works in `1_documentation.html`.
