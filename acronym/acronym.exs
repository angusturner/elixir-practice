defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace("-", " ")
    |> String.split(" ")
    |> Enum.map_join(&capitalize2/1)
    |> keep_upper
  end

  # Filter all non-upper case characters
  defp keep_upper(c) do
    Regex.replace(~r/[^A-Z]/, c, "")
  end

  # Upcase first letter of string, without downcasing remainder
  defp capitalize2(word) do
    [h | t] = String.split(word, "")
    String.upcase(h) <> Enum.join(t)
  end
end
