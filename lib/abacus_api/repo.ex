defmodule AbacusApi.Repo do
  use Ecto.Repo,
    otp_app: :abacus_api,
    adapter: Ecto.Adapters.Postgres
end
