# Ticketmaster

An Elixir library for accessing the [Ticketmaster API](http://developer.ticketmaster.com/products-and-docs/apis/discovery/v2/).

## Installation

1. Add `ticketmaster` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:ticketmaster, git: "https://github.com/seanabrahams/elixir-ticketmaster.git"}]
  end
  ```

2. Configure your Ticketmaster API key

  ```elixir
    config :ticketmaster, api_key: "<your API key>"
  ```

## Usage

### Discovery API

```elixir
# Find all events for Radiohead
Ticketmaster.Discovery.search_events(%{keyword: "radiohead"})

# Find events for Radiohead in Los Angeles, CA
Ticketmaster.Discovery.search_events(%{keyword: "radiohead", city: "Los Angeles", stateCode: "CA", countryCode: "US"})
```

See [https://github.com/seanabrahams/elixir-ticketmaster/blob/master/lib/ticketmaster/discovery.ex](https://github.com/seanabrahams/elixir-ticketmaster/blob/master/lib/ticketmaster/discovery.ex) for available functions.

### Commerce API

```elixir
# You need to obtain an event ID from searching events first
Ticketmaster.Commerce.get_event_offers("event_id_here")
```

## Todo

- [ ] Partner API
- [ ] Publish API
- [ ] Deals API
- [ ] International Discovery API
