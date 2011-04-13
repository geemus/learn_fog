# fog Binary

Now that we have gone to the trouble of doing everything via irb we will try again with another included piece that will make this simpler, the `fog` binary.

    $ bundle exec fog
    !

As you can see it will complain about a lack of credentials, you can copy and paste the example file into `~/.fog` as a start and modify it with your keys.  While we are using mock mode, however, the actual keys are unimportant so copy/paste is just fine.

    $ FOG_MOCK=true bundle exec fog
    !

    $ providers
    !

    $ AWS.collections
    !

    $ AWS[:storage].requests
    !

## Highlights

* fog allows you to setup a credential file to use rather than having to re-enter credentials (by default `~/.fog`).
* The `fog` binary allows quick and easy access to configured cloud services.
* Data in the binary is simplified to group information from given providers together.

## Next!

Now that we have a faster/easier way to access stuff we will see what it is like to switch between providers in `5_local_storage`.

### Extra Credit

* Setup additional (non-default) credential sets and launch with `bundle exec fog #{key}`.
