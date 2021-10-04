defmodule Witroos.Repo do
  use Ecto.Repo,
    otp_app: :witroos,
    adapter: Ecto.Adapters.Postgres
end
