# Witroos

## Get Started

### Local LiveView Uploads

- git checkout the `master` branch

*NOTE: the `master` branch requires Phoenix 1.5.x and uses webpack*

- > `mix deps.get`
- > `cd assets; npm install; cd ..`
- > `mix ecto.reset`
- > `mix phx.server`

### S3 LiveView Uploads

- git checkout the `s3-uploads` branch

*NOTE: the `s3-uploads` branch requires Phoenix 1.6.x, OTP 24.x and uses esbuild+tailwind+alpineJS*

- > `mix deps.get`
- > `cd assets; npm install; cd ..`
- > `mix ecto.reset`
- > `mix phx.server`

### Open Stickers Route:
- in your web browser: `http://localhost:4000/stickers`


## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
