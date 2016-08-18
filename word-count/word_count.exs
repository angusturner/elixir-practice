defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    list = clean_string(sentence)
    IO.inspect(list)
    for word <- list, into: %{} do
      freq = Enum.filter(list, &(&1 == word)) |> Enum.reduce(0, fn(_, acc)->acc+1 end)
      {word, freq}
    end
  end

  defp remove_punct(sentence) do
    String.codepoints(sentence)
    |> Enum.filter(&(&1 != String.upcase(&1) || &1 == "-" || is_int(&1)))
    |> Enum.join
  end

  #Check if something is numeric
  defp is_int(num) do
    case Integer.parse(num) do
      {_num, _bin} -> true
      :error -> false
    end
  end


  defp clean_string(sentence) do
    #Downcase, split and remove non-letter entries
    String.split(String.downcase(sentence), [" ", "_"])
    |> Enum.map(&remove_punct/1)
    |> Enum.filter(&(String.length(&1) > 0))
  end
end
