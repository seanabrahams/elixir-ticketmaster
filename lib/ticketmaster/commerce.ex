defmodule Ticketmaster.Commerce do
  use HTTPoison.Base

  def get_event_offers(id) do
    get!("events/#{id}/offers.json?").body
  end

  ##
  # Override HTTPoison.Base
  def process_url(url) do
    api_key = Application.fetch_env!(:ticketmaster, :api_key)
    Ticketmaster.base_api_url <> "commerce/v2/" <> url <> "&apikey=#{api_key}"
  end

  def process_response_body(body) do
    Ticketmaster.Shared.process_response_body(body)
  end
end
