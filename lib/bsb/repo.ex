defmodule Bsb.Repo do
  use Ecto.Repo,
    otp_app: :bsb,
    adapter: Ecto.Adapters.Postgres
end
