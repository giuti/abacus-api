# AbacusApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## Gen matches context
  * mix phx.gen.context Resources Match matches matchId:integer utcDate:string status:string matchday:integer homeTeamId:references:teams awayTeamId:references:teams homeTeamGoals:integer awayTeamGoals:integer

## Gen matches Json
  * mix phx.gen.json Resources Match matches matchId:integer utcDate:string status:string matchday:integer homeTeamId:references:teams awayTeamId:references:teams homeTeamGoals:integer awayTeamGoals:integer --no-context --no-schema