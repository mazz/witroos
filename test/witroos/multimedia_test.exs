defmodule Witroos.MultimediaTest do
  use Witroos.DataCase

  alias Witroos.Multimedia

  describe "stickers" do
    alias Witroos.Multimedia.Sticker

    @valid_attrs %{cmspaths: [], cmsroot: "some cmsroot", language: "some language", title: "some title"}
    @update_attrs %{cmspaths: [], cmsroot: "some updated cmsroot", language: "some updated language", title: "some updated title"}
    @invalid_attrs %{cmspaths: nil, cmsroot: nil, language: nil, title: nil}

    def sticker_fixture(attrs \\ %{}) do
      {:ok, sticker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Multimedia.create_sticker()

      sticker
    end

    test "list_stickers/0 returns all stickers" do
      sticker = sticker_fixture()
      assert Multimedia.list_stickers() == [sticker]
    end

    test "get_sticker!/1 returns the sticker with given id" do
      sticker = sticker_fixture()
      assert Multimedia.get_sticker!(sticker.id) == sticker
    end

    test "create_sticker/1 with valid data creates a sticker" do
      assert {:ok, %Sticker{} = sticker} = Multimedia.create_sticker(@valid_attrs)
      assert sticker.cmspaths == []
      assert sticker.cmsroot == "some cmsroot"
      assert sticker.language == "some language"
      assert sticker.title == "some title"
    end

    test "create_sticker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_sticker(@invalid_attrs)
    end

    test "update_sticker/2 with valid data updates the sticker" do
      sticker = sticker_fixture()
      assert {:ok, %Sticker{} = sticker} = Multimedia.update_sticker(sticker, @update_attrs)
      assert sticker.cmspaths == []
      assert sticker.cmsroot == "some updated cmsroot"
      assert sticker.language == "some updated language"
      assert sticker.title == "some updated title"
    end

    test "update_sticker/2 with invalid data returns error changeset" do
      sticker = sticker_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_sticker(sticker, @invalid_attrs)
      assert sticker == Multimedia.get_sticker!(sticker.id)
    end

    test "delete_sticker/1 deletes the sticker" do
      sticker = sticker_fixture()
      assert {:ok, %Sticker{}} = Multimedia.delete_sticker(sticker)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_sticker!(sticker.id) end
    end

    test "change_sticker/1 returns a sticker changeset" do
      sticker = sticker_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_sticker(sticker)
    end
  end

  describe "stickers" do
    alias Witroos.Multimedia.Sticker

    @valid_attrs %{basename: "some basename", cmspaths: [], cmsroot: "some cmsroot", language: "some language"}
    @update_attrs %{basename: "some updated basename", cmspaths: [], cmsroot: "some updated cmsroot", language: "some updated language"}
    @invalid_attrs %{basename: nil, cmspaths: nil, cmsroot: nil, language: nil}

    def sticker_fixture(attrs \\ %{}) do
      {:ok, sticker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Multimedia.create_sticker()

      sticker
    end

    test "list_stickers/0 returns all stickers" do
      sticker = sticker_fixture()
      assert Multimedia.list_stickers() == [sticker]
    end

    test "get_sticker!/1 returns the sticker with given id" do
      sticker = sticker_fixture()
      assert Multimedia.get_sticker!(sticker.id) == sticker
    end

    test "create_sticker/1 with valid data creates a sticker" do
      assert {:ok, %Sticker{} = sticker} = Multimedia.create_sticker(@valid_attrs)
      assert sticker.basename == "some basename"
      assert sticker.cmspaths == []
      assert sticker.cmsroot == "some cmsroot"
      assert sticker.language == "some language"
    end

    test "create_sticker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_sticker(@invalid_attrs)
    end

    test "update_sticker/2 with valid data updates the sticker" do
      sticker = sticker_fixture()
      assert {:ok, %Sticker{} = sticker} = Multimedia.update_sticker(sticker, @update_attrs)
      assert sticker.basename == "some updated basename"
      assert sticker.cmspaths == []
      assert sticker.cmsroot == "some updated cmsroot"
      assert sticker.language == "some updated language"
    end

    test "update_sticker/2 with invalid data returns error changeset" do
      sticker = sticker_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_sticker(sticker, @invalid_attrs)
      assert sticker == Multimedia.get_sticker!(sticker.id)
    end

    test "delete_sticker/1 deletes the sticker" do
      sticker = sticker_fixture()
      assert {:ok, %Sticker{}} = Multimedia.delete_sticker(sticker)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_sticker!(sticker.id) end
    end

    test "change_sticker/1 returns a sticker changeset" do
      sticker = sticker_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_sticker(sticker)
    end
  end

  describe "stickers" do
    alias Witroos.Multimedia.Sticker

    @valid_attrs %{basetitle: "some basetitle", cmspath: "some cmspath", cmsroot: "some cmsroot", language: "some language", localizedtitle: "some localizedtitle"}
    @update_attrs %{basetitle: "some updated basetitle", cmspath: "some updated cmspath", cmsroot: "some updated cmsroot", language: "some updated language", localizedtitle: "some updated localizedtitle"}
    @invalid_attrs %{basetitle: nil, cmspath: nil, cmsroot: nil, language: nil, localizedtitle: nil}

    def sticker_fixture(attrs \\ %{}) do
      {:ok, sticker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Multimedia.create_sticker()

      sticker
    end

    test "list_stickers/0 returns all stickers" do
      sticker = sticker_fixture()
      assert Multimedia.list_stickers() == [sticker]
    end

    test "get_sticker!/1 returns the sticker with given id" do
      sticker = sticker_fixture()
      assert Multimedia.get_sticker!(sticker.id) == sticker
    end

    test "create_sticker/1 with valid data creates a sticker" do
      assert {:ok, %Sticker{} = sticker} = Multimedia.create_sticker(@valid_attrs)
      assert sticker.basetitle == "some basetitle"
      assert sticker.cmspath == "some cmspath"
      assert sticker.cmsroot == "some cmsroot"
      assert sticker.language == "some language"
      assert sticker.localizedtitle == "some localizedtitle"
    end

    test "create_sticker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_sticker(@invalid_attrs)
    end

    test "update_sticker/2 with valid data updates the sticker" do
      sticker = sticker_fixture()
      assert {:ok, %Sticker{} = sticker} = Multimedia.update_sticker(sticker, @update_attrs)
      assert sticker.basetitle == "some updated basetitle"
      assert sticker.cmspath == "some updated cmspath"
      assert sticker.cmsroot == "some updated cmsroot"
      assert sticker.language == "some updated language"
      assert sticker.localizedtitle == "some updated localizedtitle"
    end

    test "update_sticker/2 with invalid data returns error changeset" do
      sticker = sticker_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_sticker(sticker, @invalid_attrs)
      assert sticker == Multimedia.get_sticker!(sticker.id)
    end

    test "delete_sticker/1 deletes the sticker" do
      sticker = sticker_fixture()
      assert {:ok, %Sticker{}} = Multimedia.delete_sticker(sticker)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_sticker!(sticker.id) end
    end

    test "change_sticker/1 returns a sticker changeset" do
      sticker = sticker_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_sticker(sticker)
    end
  end

  describe "stickers" do
    alias Witroos.Multimedia.Sticker

    @valid_attrs %{basetitle: "some basetitle", language: "some language", localizedtitle: "some localizedtitle", url: "some url"}
    @update_attrs %{basetitle: "some updated basetitle", language: "some updated language", localizedtitle: "some updated localizedtitle", url: "some updated url"}
    @invalid_attrs %{basetitle: nil, language: nil, localizedtitle: nil, url: nil}

    def sticker_fixture(attrs \\ %{}) do
      {:ok, sticker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Multimedia.create_sticker()

      sticker
    end

    test "list_stickers/0 returns all stickers" do
      sticker = sticker_fixture()
      assert Multimedia.list_stickers() == [sticker]
    end

    test "get_sticker!/1 returns the sticker with given id" do
      sticker = sticker_fixture()
      assert Multimedia.get_sticker!(sticker.id) == sticker
    end

    test "create_sticker/1 with valid data creates a sticker" do
      assert {:ok, %Sticker{} = sticker} = Multimedia.create_sticker(@valid_attrs)
      assert sticker.basetitle == "some basetitle"
      assert sticker.language == "some language"
      assert sticker.localizedtitle == "some localizedtitle"
      assert sticker.url == "some url"
    end

    test "create_sticker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_sticker(@invalid_attrs)
    end

    test "update_sticker/2 with valid data updates the sticker" do
      sticker = sticker_fixture()
      assert {:ok, %Sticker{} = sticker} = Multimedia.update_sticker(sticker, @update_attrs)
      assert sticker.basetitle == "some updated basetitle"
      assert sticker.language == "some updated language"
      assert sticker.localizedtitle == "some updated localizedtitle"
      assert sticker.url == "some updated url"
    end

    test "update_sticker/2 with invalid data returns error changeset" do
      sticker = sticker_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_sticker(sticker, @invalid_attrs)
      assert sticker == Multimedia.get_sticker!(sticker.id)
    end

    test "delete_sticker/1 deletes the sticker" do
      sticker = sticker_fixture()
      assert {:ok, %Sticker{}} = Multimedia.delete_sticker(sticker)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_sticker!(sticker.id) end
    end

    test "change_sticker/1 returns a sticker changeset" do
      sticker = sticker_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_sticker(sticker)
    end
  end
end
