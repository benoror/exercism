defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          :calendar.datetime()

  def from({{year, month, day}, {hours, minutes, seconds}}) do
    dt = %DateTime{calendar: Calendar.ISO, time_zone: "Etc/UTC", utc_offset: 0, std_offset: 0, zone_abbr: "UTC",
      year: year, month: month, day: day, hour: hours, minute: minutes, second: seconds}
    unix = DateTime.to_unix(dt) + 1_000_000_000
    giga = DateTime.from_unix(unix)
    {_, d} = giga
    {{d.year, d.month, d.day},{d.hour, d.minute, d.second}}
  end
end
