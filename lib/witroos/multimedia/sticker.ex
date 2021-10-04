defmodule Witroos.Multimedia.Sticker do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "stickers" do
    field :basetitle, :string
    field :language, :string
    field :localizedtitle, :string
    field :image_urls, {:array, :string}, default: []

    timestamps()
  end

  @doc false
  def changeset(sticker, attrs) do
    sticker
    |> cast(attrs, [:basetitle, :localizedtitle, :language])
    |> validate_required([:basetitle, :localizedtitle, :language])
  end
end
