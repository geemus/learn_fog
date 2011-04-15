# fog Binary

Now that we have gone to the trouble of doing everything via irb we will try again with another included piece that will make this simpler, the `fog` binary.

> ### *Exercise 10: Using the Binary*
>
> First, exit out of your irb session.
> Now we will boot into fog.
>
>     $ bundle exec fog
>     !
>
> It will complain about a lack of credentials, you can copy and paste the example file into `~/.fog` as a start and modify it with your keys.
> Note: While we are using mock mode, the actual keys are unimportant so copy/paste is just fine.
>
>     $ FOG_MOCK=true bundle exec fog
>     !
>
>     $ providers
>     !
>
>     $ AWS[:storage]
>     !
>
>     $ AWS[:storage].collections
>     !
>
>     $ AWS[:storage].requests
>     !

## Highlights

* fog allows you to setup a credential file to use rather than having to re-enter credentials (by default `~/.fog`).
* The `fog` binary allows quick and easy access to configured cloud services.
* Data in the binary is simplified to group information from given providers together.

## Next!

Now that we have a faster/easier way to access stuff we will see what it is like to switch between providers in [Local Storage](5_local_storage.html).

### Extra Credit

* Repeat earlier exercises, substituting `AWS[:storage]` for `connection`.
* Try adding and removing keys and see how it effects providers.
* Setup additional (non-default) credential sets and launch with `bundle exec fog #{key}`.
