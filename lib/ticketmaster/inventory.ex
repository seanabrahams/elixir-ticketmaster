defmodule Ticketmaster.Inventory do
  use HTTPoison.Base

  @permitted_params [
    :events
  ]

  def get_availability(args \\ %{}) do
    get!("availability?#{encoded_args(args)}").body
  end

  defp encoded_args(args) do
    URI.encode_query(Map.take(args, @permitted_params))
  end

  ##
  # Override HTTPoison.Base
  def process_url(url) do
    api_key = Application.fetch_env!(:ticketmaster, :api_key)
    Ticketmaster.base_api_url() <> "inventory-status/v1/" <> url <> "&apikey=#{api_key}"
  end

  def process_response_body(body) do
    Ticketmaster.Shared.process_response_body(body)
  end
end
