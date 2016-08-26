defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(n) do
    out = %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
    |> Enum.reduce({"", n}, fn({k, v}, {acc, n}) ->
      case rem(n, k) do
        0 -> {acc <> v, n}
        _ -> {acc, n}
      end
    end)
    |> elem(0)

    case out do
      "" -> Integer.to_string(n)
      _ -> out
    end
  end
end
