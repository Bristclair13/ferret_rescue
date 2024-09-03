defmodule FerretRescueWeb.Live.Home do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class=" h-full bg-[url('/images/tree_bark.png')]  bg-repeat"></div>
    """
  end
end
