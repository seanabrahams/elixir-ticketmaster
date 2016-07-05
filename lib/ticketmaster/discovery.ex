defmodule Ticketmaster.Discovery do
  use HTTPoison.Base

  @permitted_params [
    :keyword,
    :attractionId,
    :venueId,
    :promoterId,
    :postalCode,
    :latlong,
    :radius,
    :unit,
    :source,
    :locale,
    :marketId,
    :startDateTime,
    :endDateTime,
    :onsaleStartDateTime,
    :onsaleEndDateTime,
    :includeTBA,
    :includeTBD,
    :includeTest,
    :size,
    :page,
    :sort,
    :city,
    :countryCode,
    :stateCode,
    :classificationId,
    :classificationName,
    :dmaId,
    :apikey
  ]

  def search_events(args \\ %{}) do
    get!("events.json?#{encoded_args(args)}").body
  end

  def get_event(id, args \\ %{}) do
    get!("events/#{id}.json?#{encoded_args(args)}").body
  end

  def get_event_images(id, args \\ %{}) do
    get!("events/#{id}/images.json?#{encoded_args(args)}").body
  end

  def search_attractions(args \\ %{}) do
    get!("attractions.json?#{encoded_args(args)}").body
  end

  def get_attraction(id, args \\ %{}) do
    get!("attractions/#{id}.json?#{encoded_args(args)}").body
  end

  def search_classifications(args \\ %{}) do
    get!("classifications.json?#{encoded_args(args)}").body
  end

  def get_classification(id, args \\ %{}) do
    get!("classifications/#{id}.json?#{encoded_args(args)}").body
  end

  def search_venues(args \\ %{}) do
    get!("venues.json?#{encoded_args(args)}").body
  end

  def get_venue(id, args \\ %{}) do
    get!("venues/#{id}.json?#{encoded_args(args)}").body
  end

  defp encoded_args(args) do
    URI.encode_query(Map.take(args, @permitted_params))
  end

  ##
  # Override HTTPoison.Base
  def process_url(url) do
    api_key = Application.fetch_env!(:ticketmaster, :api_key)
    Ticketmaster.base_api_url <> "discovery/v2/" <> url <> "&apikey=#{api_key}"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end
end
