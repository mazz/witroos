defmodule Witroos.Repo.Migrations.CreateStickers do
  use Ecto.Migration

  def change do
    create table(:stickers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :basetitle, :string
      add :localizedtitle, :string
      add :language, :string
      add :image_urls, {:array, :string}, null: false, default: []

      timestamps()
    end

  end
end
