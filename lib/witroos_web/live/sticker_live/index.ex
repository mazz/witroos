defmodule WitroosWeb.StickerLive.Index do
  use WitroosWeb, :live_view

  alias Witroos.Multimedia
  alias Witroos.Multimedia.Sticker

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :stickers, list_stickers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Sticker")
    |> assign(:sticker, Multimedia.get_sticker!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Sticker")
    |> assign(:sticker, %Sticker{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Stickers")
    |> assign(:sticker, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    sticker = Multimedia.get_sticker!(id)
    {:ok, _} = Multimedia.delete_sticker(sticker)

    {:noreply, assign(socket, :stickers, list_stickers())}
  end

  defp list_stickers do
    Multimedia.list_stickers()
  end
end
