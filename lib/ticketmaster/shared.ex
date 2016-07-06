defmodule Ticketmaster.Shared do
  def process_response_body(body) do
    try do
      body
      |> Poison.decode!
    rescue
      # Unzip the response if it's gzipped. Amazing this isn't done by default.
      # See https://github.com/edgurgel/httpoison/issues/81
      Poison.SyntaxError ->
        :zlib.gunzip(body)
        |> Poison.decode
    end
  end
end
