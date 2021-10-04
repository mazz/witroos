defmodule WitroosWeb.StickerLive.Show do
  use WitroosWeb, :live_view

  alias Witroos.Multimedia

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:sticker, Multimedia.get_sticker!(id))}
  end

  defp page_title(:show), do: "Show Sticker"
  defp page_title(:edit), do: "Edit Sticker"
end
