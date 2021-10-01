defmodule PwaPhx.Repo do
  use Ecto.Repo,
    otp_app: :pwa_phx,
    adapter: Ecto.Adapters.Postgres
end
