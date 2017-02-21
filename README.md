# Überauth Goodreads

> Goodreads strategy for Überauth.

_Note_: Sessions are required for this strategy.

## Installation

1. Setup your application at [Gooreads Developers](https://www.goodreads.com/api/keys).

1. Add `:ueberauth_goodreads` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ueberauth_goodreads, "~> 0.1"},
       {:oauth, github: "tim/erlang-oauth"}]
    end
    ```

1. Add the strategy to your applications:

    ```elixir
    def application do
      [applications: [:ueberauth_goodreads]]
    end
    ```

1. Add Goodreads to your Überauth configuration:

    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        goodreads: {Ueberauth.Strategy.Goodreads, []}
      ]
    ```

1.  Update your provider configuration:

    ```elixir
    config :ueberauth, Ueberauth.Strategy.Goodreads.OAuth,
      consumer_key: System.get_env("GOODREADS_CONSUMER_KEY"),
      consumer_secret: System.get_env("GOODREADS_CONSUMER_SECRET")
    ```

1.  Include the Überauth plug in your controller:

    ```elixir
    defmodule MyApp.AuthController do
      use MyApp.Web, :controller
      plug Ueberauth
      ...
    end
    ```

1.  Create the request and callback routes if you haven't already:

    ```elixir
    scope "/auth", MyApp do
      pipe_through :browser

      get "/:provider", AuthController, :request
      get "/:provider/callback", AuthController, :callback
    end
    ```

1. You controller needs to implement callbacks to deal with `Ueberauth.Auth` and `Ueberauth.Failure` responses.

For an example implementation see the [Überauth Example](https://github.com/ueberauth/ueberauth_example) application.

## Calling

Depending on the configured url you can initial the request through:

    /auth/goodreads

## License

Please see [LICENSE](https://github.com/tielur/ueberauth_goodreads/blob/master/LICENSE) for licensing details.