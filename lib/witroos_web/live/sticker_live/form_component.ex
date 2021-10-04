defmodule WitroosWeb.StickerLive.FormComponent do
  use WitroosWeb, :live_component

  alias Witroos.Multimedia
  alias Witroos.Multimedia.{Sticker}

  @impl true
  def mount(socket) do
    {:ok, allow_upload(socket, :photo, accept: ~w(.png .jpg .jpeg))}
  end

  @impl true
  def update(%{sticker: sticker} = assigns, socket) do
    changeset = Multimedia.change_sticker(sticker)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"sticker" => sticker_params}, socket) do
    changeset =
      socket.assigns.sticker
      |> Multimedia.change_sticker(sticker_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"sticker" => sticker_params}, socket) do
    save_sticker(socket, socket.assigns.action, sticker_params)
  end

  defp save_sticker(socket, :edit, sticker_params) do
    sticker = put_photo_url(socket, socket.assigns.sticker)

    # case Multimedia.update_sticker(socket.assigns.sticker, sticker_params) do
    case Multimedia.create_sticker(sticker, sticker_params, &consume_photo(socket, &1)) do
      {:ok, _sticker} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sticker updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_sticker(socket, :new, sticker_params) do
    sticker = put_photo_url(socket, %Sticker{})

    case Multimedia.create_sticker(sticker, sticker_params, &consume_photo(socket, &1)) do
    # case Multimedia.create_sticker(sticker, sticker_params) do
      {:ok, _sticker} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sticker created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp ext(entry) do
    [ext | _] = MIME.extensions(entry.client_type)
    ext
  end

  defp put_photo_url(socket, %Sticker{} = sticker) do
    {completed, []} = uploaded_entries(socket, :photo)

    urls =
      for entry <- completed do
        Routes.static_path(socket, "/uploads/#{entry.uuid}.#{ext(entry)}")
      end

    %Sticker{sticker | image_urls: urls}
  end

  def consume_photo(socket, %Sticker{} = sticker) do
    consume_uploaded_entries(socket, :photo, fn meta, entry ->
      dest = Path.join("priv/static/uploads", "#{entry.uuid}.#{ext(entry)}")
      File.cp!(meta.path, dest)
    end)

    {:ok, sticker}
  end
end
